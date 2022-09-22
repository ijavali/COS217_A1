/*--------------------------------------------------------------------*/
/* decomment.c                                                        */
/* Author: Ishaan Javali                                              */
/*--------------------------------------------------------------------*/

#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

/* enum consisting of constants representing each state in the DFA */
enum Statetype {
    OUTSIDE,
    OPENING_COMMENT,
    CLOSING_COMMENT,
    IN_COMMENT,
    IN_STRING_LITERAL,
    IN_CHAR_LITERAL,
    ESCAPE_IN_CHAR,
    ESCAPE_IN_STRING
};

/* Implement the OUTSIDE state of the DFA. c is the current DFA character.
Write c to stdout only if it is not the start of a new comment, as specified by
the DFA. Return the next state. */
enum Statetype handleOutsideState(int c) {
    enum Statetype state;
    if (c == '/') {
        state = OPENING_COMMENT;
    } else if (c == '"') {
        putchar(c);
        state = IN_STRING_LITERAL;
    } else if (c == '\'') {
        putchar(c);
        state = IN_CHAR_LITERAL;
    } else {
        putchar(c);
        state = OUTSIDE;
    }
    return state;
}

/* Implement the OPENING_COMMENT state of the DFA. c is the current DFA
character. Write c to stdout only if it is not the asterisk of a new comment, as
specified by the DFA. Return the next state. */
enum Statetype handleOpeningCommentState(int c, int* commentStartLine,
                                         int* lines) {
    enum Statetype state;
    if (c == '*') {
        state = IN_COMMENT;
        *commentStartLine = *lines;
    } else if (c == '/') {
        putchar('/');
        state = OPENING_COMMENT;
    } else if (c == '"') {
        putchar('/');
        putchar(c);
        state = IN_STRING_LITERAL;
    } else if (c == '\'') {
        putchar('/');
        putchar(c);
        state = IN_CHAR_LITERAL;
    } else {
        putchar('/');
        putchar(c);
        state = OUTSIDE;
    }
    return state;
}

/* Implement the IN_COMMENT state of the DFA. c is the current DFA character.
Return the next state as determined by the DFA. */
enum Statetype handleInCommentState(int c, int* linesInComment) {
    enum Statetype state = IN_COMMENT;
    if (c == '*') {
        state = CLOSING_COMMENT;
    } else if (c == '\n') {
        (*linesInComment)++;
    }
    return state;
}

/* Implement the CLOSING_COMMENT state of the DFA. c is the current DFA
character. Write ' ' to stdout followed by newline characters only if c is the
end of a comment, as specified by the DFA. Return the next state. */
/*Handles state where there may or may not be a comment about to be closed.*/
enum Statetype handleClosingCommentState(int c, int* linesInComment) {
    int i = 0;
    enum Statetype state = IN_COMMENT;
    if (c == '/') {
        state = OUTSIDE;
        putchar(' ');
        for (; i < *linesInComment; i++) {
            putchar('\n');
        }
        *linesInComment = 0;
    } else if (c == '*') {
        state = CLOSING_COMMENT;
    } else if (c == '\n') {
        (*linesInComment)++;
    }
    return state;
}

/* Implement the IN_STRING_LITERAL state of the DFA. c is the current DFA
character. Write c to stdout. Return the next state as determined by the DFA. */
enum Statetype handleInStringLiteralState(int c) {
    enum Statetype state = IN_STRING_LITERAL;
    putchar(c);
    if (c == '\\') {
        state = ESCAPE_IN_STRING;
    } else if (c == '"') {
        state = OUTSIDE;
    }
    return state;
}

/* Implement the IN_CHAR_LITERAL state of the DFA. c is the current DFA
character. Write c to stdout. Return the next state as determined by the DFA. */
enum Statetype handleInCharLiteralState(int c) {
    enum Statetype state = IN_CHAR_LITERAL;
    putchar(c);
    if (c == '\\') {
        state = ESCAPE_IN_CHAR;
    } else if (c == '\'') {
        state = OUTSIDE;
    }
    return state;
}

/* Implement the ESCAPE_IN_CHAR state of the DFA. c is the current DFA
character. Write c to stdout. Return the state IN_CHAR_LITERAL. */
enum Statetype handleEscapeInCharState(int c) {
    enum Statetype state = IN_CHAR_LITERAL;
    putchar(c);
    return state;
}

/* Implement the ESCAPE_IN_STRING state of the DFA. c is the current DFA
character. Write c to stdout. Return the state IN_STRING_LITERAL. */
enum Statetype handleEscapeInStringState(int c) {
    enum Statetype state = IN_STRING_LITERAL;
    putchar(c);
    return state;
}

/* Read text from stdin. Write the text to stdout as long as it is not part of a
comment. Ignore comments within string or character literals. Write to stderr
and return EXIT_FAILURE if the text ends with an unterminated comment, otherwise
return EXIT_SUCCESS. */
int main() {
    int commentStartLine = 0;
    int linesInComment = 0;
    int i = 0;
    int lines = 1;
    int c;
    enum Statetype state = OUTSIDE;
    while ((c = getchar()) != EOF) {
        if (c == '\n') lines++;
        switch (state) {
            case OUTSIDE:
                state = handleOutsideState(c);
                break;
            case OPENING_COMMENT:
                state = handleOpeningCommentState(c, &commentStartLine, &lines);
                break;
            case CLOSING_COMMENT:
                state = handleClosingCommentState(c, &linesInComment);
                break;
            case IN_COMMENT:
                state = handleInCommentState(c, &linesInComment);
                break;
            case IN_STRING_LITERAL:
                state = handleInStringLiteralState(c);
                break;
            case IN_CHAR_LITERAL:
                state = handleInCharLiteralState(c);
                break;
            case ESCAPE_IN_CHAR:
                state = handleEscapeInCharState(c);
                break;
            case ESCAPE_IN_STRING:
                state = handleEscapeInStringState(c);
                break;
        }
    }

    if (state == IN_COMMENT || state == CLOSING_COMMENT) {
        fprintf(stderr, "Error: line %d: unterminated comment\n",
                commentStartLine);
        putchar(' ');
        /*There may be newlines from the unclosed comment that were never
         * printed.*/
	while (i++ < linesInComment){
            putchar('\n');
        }
        return EXIT_FAILURE;
    } else {
        /*If the very last character is '/' and it didn't get printed in
         * anticipation of a following '*', print '/' now.*/
        if (state == OPENING_COMMENT) {
            putchar('/');
        }
        return EXIT_SUCCESS;
    }
}
