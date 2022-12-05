/'***********************************************************
* 作者：伍耀晖              Author: Geek.Zhiyuan            *
* 开源日期：2022年7月7日    Open Source Date: 2022-7-7      *
* 国家城市：中国广州        City, Country: GuangZhou, China *
***********************************************************'/
' Compiled by free basic. free basic website: www.freebasic.net

#include "file.bi"

Sub Usage()
    Print "Usage" & Chr(10) & Chr(9) & "Encryption: Trident -e/-E Plaintext.file Ciphertext.file Password" & Chr(10) & Chr(9) & "Decryption: Trident -d/-D Ciphertext.file Plaintext.file Password"
End Sub

Sub Tirnary(ubpTrinary As UByte Pointer, ByVal usNumeric As UShort)
    ubpTrinary[0] = 0

    ubpTrinary[1] = 0

    ubpTrinary[2] = 0

    ubpTrinary[3] = 0

    ubpTrinary[4] = 0

    ubpTrinary[5] = 0

    If usNumeric <> 0 Then
        For i As Byte = 5 To 0 Step -1
            ubpTrinary[i] = usNumeric Mod 3

            usNumeric \= 3
        Next i
    End If
End Sub

/'
 0 0 2
 1 1 1
 2 2 0
'/

Sub TrinaryXOr0(ubaPlaintextOrCiphertext() As UByte, ubpPassword As UByte Pointer)
    For j As UByte = 0 To 5
        If ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 0

        Elseif ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 0

        Elseif ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 2

        Elseif ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 1

        Elseif ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 1

        Elseif ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 1

        Elseif ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 2

        Elseif ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 2

        Elseif ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 0

        End If
    Next j
End Sub

/'
 0 2 2
 1 1 1
 2 0 0
'/

Sub TrinaryXOr2(ubaPlaintextOrCiphertext() As UByte, ubpPassword As UByte Pointer)
    For j As UByte = 0 To 5
        If ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 0

        Elseif ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 2

        Elseif ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 2

        Elseif ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 1

        Elseif ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 1

        Elseif ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 1

        Elseif ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 2

        Elseif ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 0

        Elseif ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 0

        End If
    Next j
End Sub

/'
 2 0 0
 1 1 1
 0 2 2
'/

Sub TrinaryXAnd0(ubaPlaintextOrCiphertext() As UByte, ubpPassword As UByte Pointer)
    For k As UByte = 0 To 5
        If ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 2
        Elseif ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 0
        Elseif ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 0
        Elseif ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 1
        Elseif ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 1
        Elseif ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 1
        Elseif ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 0
        Elseif ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 2
        Elseif ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 2
        End If
    Next k
End Sub

/'
 2 2 0
 1 1 1
 0 0 2
'/

Sub TrinaryXAnd2(ubaPlaintextOrCiphertext() As UByte, ubpPassword As UByte Pointer)
    For k As UByte = 0 To 5
        If ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 2
        Elseif ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 2
        Elseif ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 0
        Elseif ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 1
        Elseif ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 1
        Elseif ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 1
        Elseif ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 0
        Elseif ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 0
        Elseif ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 2
        End If
    Next k
End Sub

Sub Main()
    Dim As UByte ubCLAA = 1, k = 0, ubPasswordLength, ubaPassword(), ubaPlaintextOrCiphertext(5)

    Dim As String strPassword

    Dim As ULongInt ulFileSize

    Dim As UByte Pointer ubpPlaintext

    Dim As UShort Pointer uspCiphertext

    Do
        Dim As String strCLA = Command(ubCLAA)

        If Len(strCLA) = 0 Then
            Exit Do
        End If

        ubCLAA += 1
    Loop

    If ubCLAA <> 5 Then : Usage()

    Elseif Command(1) = "-e" OrElse Command(1) = "-E" Then
        ulFileSize = FileLen(Command(2))

        If ulFileSize = 0 Then
            Print "There is no data in file [" & Command(2) & "], 0 byte."

            End -1
        End If

        ubpPlaintext = New UByte[ulFileSize]

        Open Command(2) For Binary Access Read As #3

        Get #3, , *ubpPlaintext, ulFileSize

        Close #3

        uspCiphertext = New UShort[ulFileSize]

        strPassword = Command(4)

        ubPasswordLength = Len(Command(4))

        ReDim ubaPassword(ubPasswordLength - 1, 5)

        For i As UByte = 0 To ubPasswordLength - 1
            Tirnary(@ubaPassword(i, 0), strPassword[i])
        Next i

        For j As ULongInt = 0 To ulFileSize - 1
            Tirnary(@ubaPlaintextOrCiphertext(0), ubpPlaintext[j])

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            uspCiphertext[j] = 243 * ubaPlaintextOrCiphertext(0) + 81 * ubaPlaintextOrCiphertext(1) + 27 * ubaPlaintextOrCiphertext(2) + 9 * ubaPlaintextOrCiphertext(3) + 3 * ubaPlaintextOrCiphertext(4) + ubaPlaintextOrCiphertext(5)

            k = (k + 1) Mod ubPasswordLength
        Next j

        Delete ubpPlaintext

        Open Command(3) For Binary Access Write As #4

        Put #4, , *uspCiphertext, ulFileSize

        Close #4

        Delete uspCiphertext
    Elseif Command(1) = "-d" OrElse Command(1) = "-D" Then
        ulFileSize = FileLen(Command(2)) \ 2

        If ulFileSize = 0 Then
            Print "There is no data in file [" & Command(2) & "], 0 byte."

            End -1
        End If

        uspCiphertext = New UShort[ulFileSize]

        Open Command(2) For Binary Access Read As #3

        Get #3, , *uspCiphertext, ulFileSize

        Close #3

        ubpPlaintext = New UByte[ulFileSize]

        strPassword = Command(4)

        ubPasswordLength = Len(Command(4))

        ReDim ubaPassword(ubPasswordLength - 1, 5)

        For i As UByte = 0 To ubPasswordLength - 1
            Tirnary(@ubaPassword(i, 0), strPassword[i])
        Next i

        For j As ULongInt = 0 To ulFileSize - 1
            Tirnary(@ubaPlaintextOrCiphertext(0), uspCiphertext[j])

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            'TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            ubpPlaintext[j] = 243 * ubaPlaintextOrCiphertext(0) + 81 * ubaPlaintextOrCiphertext(1) + 27 * ubaPlaintextOrCiphertext(2) + 9 * ubaPlaintextOrCiphertext(3) + 3 * ubaPlaintextOrCiphertext(4) + ubaPlaintextOrCiphertext(5)

            k = (k + 1) Mod ubPasswordLength
        Next j

        Delete uspCiphertext

        Open Command(3) For Binary Access Write As #4

        Put #4, , *ubpPlaintext, ulFileSize

        Close #4

        Delete ubpPlaintext
    Else
        Usage()
    End If
End Sub

Main()