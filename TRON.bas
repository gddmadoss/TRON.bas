CONST TRUE = 1
CONST FALSE = 0
SCREEN 0, 0, 0
WIDTH 80, 25
CALL DRAW_SCREEN
number = 0: hit = 0
start = TIMER + 0.25
direction = 6
row = 10
column = 2
char$ = CHR$(196)
hit = 0
col = 9
DO
    A$ = INKEY$
    A$ = RIGHT$(A$, 1)
    IF pressed = 0 THEN IF A$ <> "" THEN pressed = 1
    IF pressed = 1 THEN
        old = direction
        pressed = 2
    END IF
    '    LOCATE 19, 1: COLOR 11: PRINT A$
    SELECT CASE A$
        CASE "8": direction = 8
        CASE "H": direction = 8
        CASE "6": direction = 6
        CASE "M": direction = 6
        CASE "4": direction = 4
        CASE "K": direction = 4
        CASE "2": direction = 2
        CASE "P": direction = 2
    END SELECT
    '    LOCATE 17, 1: COLOR 14: PRINT direction
    '   LOCATE 15, 1: COLOR 12: PRINT start
    '  LOCATE 16, 1: COLOR 13: PRINT TIMER
    ' LOCATE 18, 1: COLOR 12: PRINT DRAWING
    IF start < TIMER THEN
        start = TIMER + 0.15
        DRAWING = TRUE
    END IF
    IF DRAWING = TRUE THEN
        pressed = 0
        IF old = 2 AND direction = 2 THEN char$ = CHR$(179)
        IF old = 2 AND direction = 4 THEN char$ = CHR$(217)
        IF old = 2 AND direction = 6 THEN char$ = CHR$(192)
        IF old = 4 AND direction = 4 THEN char$ = CHR$(196)
        IF old = 4 AND direction = 2 THEN char$ = CHR$(218)
        IF old = 4 AND direction = 8 THEN char$ = CHR$(192)
        IF old = 6 AND direction = 6 THEN char$ = CHR$(196)
        IF old = 6 AND direction = 8 THEN char$ = CHR$(217)
        IF old = 6 AND direction = 2 THEN char$ = CHR$(191)
        IF old = 8 AND direction = 8 THEN char$ = CHR$(179)
        IF old = 8 AND direction = 6 THEN char$ = CHR$(218)
        IF old = 8 AND direction = 4 THEN char$ = CHR$(191)
        DRAWING = FALSE
        COLOR col
        LOCATE row, column
        PRINT char$
        old = direction
        SELECT CASE direction
            CASE 2: row = row + 1
            CASE 4: column = column - 1
            CASE 6: column = column + 1
            CASE 8: row = row - 1
        END SELECT
        IF row = 0 THEN row = 22: hit = 1
        IF row = 23 THEN row = 1: hit = 1
        IF column = 0 THEN column = 80: hit = 1
        IF column = 81 THEN column = 1: hit = 1
        ' LOCATE 23, 1: COLOR 5: PRINT SCREEN(row, column)
        seeing = SCREEN(row, column)
        IF seeing <> 32 THEN hit = 1
        IF hit = 1 THEN
            col = col + 1
            hit = 0
        END IF
        IF col = 16 THEN col = 1
    END IF
LOOP UNTIL hit = 1 OR A$ = CHR$(27)

SUB DRAW_SCREEN
COLOR 0, 0
CLS
COLOR 15, 1
FOR lll = 1 TO 23
    IF lll = 1 THEN
        PRINT CHR$(201); STRING$(78, 205); CHR$(187)
    ELSEIF lll = 23 THEN
        PRINT CHR$(200); STRING$(78, 205); CHR$(188)
    ELSE
        LOCATE lll, 1: PRINT CHR$(186)
        LOCATE lll, 80: PRINT CHR$(186)
    END IF
NEXT lll
COLOR 0, 0
END SUB
