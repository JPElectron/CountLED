Attribute VB_Name = "Module1"
Sub IncNum()
    'On Error Resume Next
    Dim count As Integer
    Dim Digits(0 To 3) As Integer

    Open "count.dat" For Input As #1
        If Err Then
            count = 0
        Else
            Input #1, count
        End If
    Close
    
    count = count + 1
    
    Open "count.dat" For Output As #1
        Print #1, count
    Close
    
    Digits(2) = count \ 1000 'thousands place
    Digits(3) = (count Mod 1000) \ 100 'hundred
    Digits(0) = ((count Mod 1000) Mod 100) \ 10 'tens
    Digits(1) = (((count Mod 1000) Mod 100) Mod 10) 'ones
    
    Open "count.ini" For Input As #1
        If Not Err Then
            Input #1, Port
        End If
    Close
    
    Form1.Comm.CommPort = Str(Port)
    Form1.Comm.Handshaking = None
    Form1.Comm.Settings = "2400,N,8,1"
    Form1.Comm.OutBufferSize = 4096
    Form1.Comm.InputLen = 0
    Form1.Comm.RThreshold = 1
    Form1.Comm.SThreshold = 1
    Form1.Comm.DTREnable = True
    Form1.Comm.PortOpen = True
    
    't = 0 is left most, t=max is right most
    For t = 1 To 4          'update display 1 to 4
        characterpointer = t
        Character = Digits(t - 1) + 48 ' 0..9 + 48 = ASCII value of character
        checksum = (255 - ((((13 + characterpointer + Asc("A") + Character) / 256) - Int((13 + characterpointer + Asc("A") + Character) / 256)) * 256)) + 1
        If checksum = 256 Then checksum = 0
        messagestring = Chr$(13) & Chr$(characterpointer) & "A" & Chr$(Character) & Chr$(checksum)
        messagestring = messagestring + messagestring
        Form1.Comm.Output = messagestring
        Call delay

    Next t
    Call strobe
    
    Form1.Comm.PortOpen = False
    
    
End Sub

Sub DecNum()
    'On Error Resume Next
    Dim count As Integer
    Dim Digits(0 To 3) As Integer

    Open "count.dat" For Input As #1
        If Err Then
            count = 0
        Else
            Input #1, count
        End If
    Close
    
    count = count - 1
    If count < 0 Then count = 0
    
    Open "count.dat" For Output As #1
        Print #1, count
    Close
    
    Digits(2) = count \ 1000 'thousands place
    Digits(3) = (count Mod 1000) \ 100 'hundred
    Digits(0) = ((count Mod 1000) Mod 100) \ 10 'tens
    Digits(1) = (((count Mod 1000) Mod 100) Mod 10) 'ones
    
    Open "count.ini" For Input As #1
        If Not Err Then
            Input #1, Port
        End If
    Close
    
    Form1.Comm.CommPort = Port
    Form1.Comm.Handshaking = None
    Form1.Comm.Settings = "2400,N,8,1"
    Form1.Comm.OutBufferSize = 4096
    Form1.Comm.InputLen = 0
    Form1.Comm.RThreshold = 1
    Form1.Comm.SThreshold = 1
    Form1.Comm.DTREnable = True
    Form1.Comm.PortOpen = True
    
    't = 0 is left most, t=max is right most
    For t = 1 To 4          'update display 1 to 4
        characterpointer = t
        Character = Digits(t - 1) + 48 ' 0..9 + 48 = ASCII value of character
        checksum = (255 - ((((13 + characterpointer + Asc("A") + Character) / 256) - Int((13 + characterpointer + Asc("A") + Character) / 256)) * 256)) + 1
        If checksum = 256 Then checksum = 0
        messagestring = Chr$(13) & Chr$(characterpointer) & "A" & Chr$(Character) & Chr$(checksum)
        messagestring = messagestring + messagestring
        Form1.Comm.Output = messagestring
        Call delay
    Next t
    Call delay
        Call strobe
    Form1.Comm.PortOpen = False
    
End Sub

Private Sub strobe() 'to generate the 'Strobe'-command, which updates all displays
commandstring = Chr$(13) & Chr$(0) & "S" & Chr$(0) & Chr$(160)
Form1.Comm.Output = commandstring

End Sub

Sub BlankIt()
    On Error Resume Next
    Dim Digits(0 To 3) As Integer
    
    Open "count.ini" For Input As #1
        If Not Err Then
            Input #1, Port
        End If
    Close
    
    Form1.Comm.CommPort = Port
    Form1.Comm.Handshaking = None
    Form1.Comm.Settings = "2400,N,8,1"
    Form1.Comm.OutBufferSize = 4096
    Form1.Comm.InputLen = 0
    Form1.Comm.RThreshold = 1
    Form1.Comm.SThreshold = 1
    Form1.Comm.DTREnable = True
    Form1.Comm.PortOpen = True
    
    Digits(0) = 0
    Digits(1) = 0
    Digits(2) = 0
    Digits(3) = 0
    't = 0 is left most, t=max is right most
    For t = 1 To 4          'update display 1 to 4
        characterpointer = t
        Character = Digits(t - 1) + 48 ' 0..9 + 48 = ASCII value of character
        checksum = (255 - ((((13 + characterpointer + Asc("A") + Character) / 256) - Int((13 + characterpointer + Asc("A") + Character) / 256)) * 256)) + 1
        If checksum = 256 Then checksum = 0
        messagestring = Chr$(13) & Chr$(characterpointer) & "A" & Chr$(Character) & Chr$(checksum)
        messagestring = messagestring + messagestring
        Form1.Comm.Output = messagestring
        Call delay
    Next t
    Call delay
    Call strobe
    Form1.Comm.PortOpen = False
    
    For i = 0 To 20
    Call delay
    Next i
    
    Form1.Comm.CommPort = Port
    Form1.Comm.Handshaking = None
    Form1.Comm.Settings = "2400,N,8,1"
    Form1.Comm.OutBufferSize = 4096
    Form1.Comm.InputLen = 0
    Form1.Comm.RThreshold = 1
    Form1.Comm.SThreshold = 1
    Form1.Comm.DTREnable = True
    Form1.Comm.PortOpen = True
    

    chksum = 256 - (13 + 0 + Asc("E") + 0) Mod 256
    commandstring = Chr$(13) & Chr$(0) & "E" & Chr$(0) & Chr$(chksum)
    Form1.Comm.Output = commandstring
    
    Call delay

    Form1.Comm.PortOpen = False
    
    Open "count.dat" For Output As #1
    Print #1, 0
    Close
End Sub

Sub delay()     'short delay routine
oldtimer = Timer
Loopje:
If Timer >= oldtimer + 0.1 Then GoTo leave
GoTo Loopje
leave:
End Sub

Sub Main()
    On Error Resume Next
    Dim strArgs() As String
    Debug.Print Now
    Load Form1
    Open "count.ini" For Input As #1
    If Err Then
        Open "count.ini" For Output As #1
            Print #1, "1" 'form1.comm1 default
        Close
    End If
    Close
    
    strArgs = Split(Command$, " ")
    If UBound(strArgs) >= 0 Then
        Select Case (LCase(strArgs(0)))
            Case "j"
                Debug.Print "join"
                IncNum
            Case "l"
                Debug.Print "leave"
                DecNum
            Case "s1"
                Debug.Print "s1"
                'Circlify
            Case "s2"
                Debug.Print "s2"
                'Eightify
            Case Else
                Debug.Print "no flags"
                BlankIt
        End Select
    Else
        Debug.Print "no flags default"
        BlankIt
    End If
    Unload Form1
End Sub

