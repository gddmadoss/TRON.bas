Const TRUE = 1
Const FALSE = 0
Screen 0, 0, 0
Width 80, 25
Call DRAW_SCREEN
number = 0: hit = 0
start = Timer + 0.25
direction = 6
row = 10
column = 2
char$ = Chr$(196)
hit = 0
col = 9
Do
    A$ = InKey$
    A$ = Right$(A$, 1)
    If pressed = 0 Then If A$ <> "" Then pressed = 1
    If pressed = 1 Then
        old = direction
        pressed = 2
    End If
    '    LOCATE 19, 1: COLOR 11: PRINT A$
    Select Case A$
        Case "8": direction = 8
        Case "H": direction = 8
        Case "6": direction = 6
        Case "M": direction = 6
        Case "4": direction = 4
        Case "K": direction = 4
        Case "2": direction = 2
        Case "P": direction = 2
    End Select
    '    LOCATE 17, 1: COLOR 14: PRINT direction
    '   LOCATE 15, 1: COLOR 12: PRINT start
    '  LOCATE 16, 1: COLOR 13: PRINT TIMER
    ' LOCATE 18, 1: COLOR 12: PRINT DRAWING
    If start < Timer Then
        start = Timer + 0.15
        DRAWING = TRUE
    End If
    If DRAWING = TRUE Then
        pressed = 0
        If old = 2 And direction = 2 Then char$ = Chr$(179)
        If old = 2 And direction = 4 Then char$ = Chr$(217)
        If old = 2 And direction = 6 Then char$ = Chr$(192)
        If old = 4 And direction = 4 Then char$ = Chr$(196)
        If old = 4 And direction = 2 Then char$ = Chr$(218)
        If old = 4 And direction = 8 Then char$ = Chr$(192)
        If old = 6 And direction = 6 Then char$ = Chr$(196)
        If old = 6 And direction = 8 Then char$ = Chr$(217)
        If old = 6 And direction = 2 Then char$ = Chr$(191)
        If old = 8 And direction = 8 Then char$ = Chr$(179)
        If old = 8 And direction = 6 Then char$ = Chr$(218)
        If old = 8 And direction = 4 Then char$ = Chr$(191)
        DRAWING = FALSE
        Color col
        Locate row, column
        Print char$
        old = direction
        Select Case direction
            Case 2: row = row + 1
            Case 4: column = column - 1
            Case 6: column = column + 1
            Case 8: row = row - 1
        End Select
        If row = 0 Then row = 22: hit = 1
        If row = 23 Then row = 1: hit = 1
        If column = 0 Then column = 80: hit = 1
        If column = 81 Then column = 1: hit = 1
        ' LOCATE 23, 1: COLOR 5: PRINT SCREEN(row, column)
        seeing = Screen(row, column)
        If seeing <> 32 Then hit = 1
        If hit = 1 Then
            col = col + 1
            hit = 0
        End If
        If col = 16 Then col = 1
    End If
Loop Until hit = 1 Or A$ = Chr$(27)

Sub DRAW_SCREEN
    Color 0, 0
    Cls
    Color 15, 1
    For lll = 1 To 23
        If lll = 1 Then
            Print Chr$(201); String$(78, 205); Chr$(187)
        ElseIf lll = 23 Then
            Print Chr$(200); String$(78, 205); Chr$(188)
        Else
            Locate lll, 1: Print Chr$(186)
            Locate lll, 80: Print Chr$(186)
        End If
    Next lll
    Color 0, 0
End Sub
