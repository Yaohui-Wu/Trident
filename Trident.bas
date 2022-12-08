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

Sub Tirnary(ubpTrinary As UByte Pointer,_
            ByVal lNumeric As LongInt)
    ubpTrinary[0] = 0

    ubpTrinary[1] = 0

    ubpTrinary[2] = 0

    ubpTrinary[3] = 0

    ubpTrinary[4] = 0

    ubpTrinary[5] = 0

    If lNumeric <> 0 Then
        For i As LongInt = 5 To 0 Step -1
            ubpTrinary[i] = lNumeric Mod 3

            lNumeric \= 3
        Next i
    End If
End Sub

/'
 0 0 2
 1 1 1
 2 2 0
'/

Sub TrinaryXOr0(ubaPlaintextOrCiphertext() As UByte,_
                ubpPassword As UByte Pointer)
    For i As LongInt = 0 To 5
        If ubaPlaintextOrCiphertext(i) = 0 AndAlso ubpPassword[i] = 0 Then
            ubaPlaintextOrCiphertext(i) = 0

        ElseIf ubaPlaintextOrCiphertext(i) = 0 AndAlso ubpPassword[i] = 1 Then
            ubaPlaintextOrCiphertext(i) = 0

        ElseIf ubaPlaintextOrCiphertext(i) = 0 AndAlso ubpPassword[i] = 2 Then
            ubaPlaintextOrCiphertext(i) = 2

        ElseIf ubaPlaintextOrCiphertext(i) = 1 AndAlso ubpPassword[i] = 0 Then
            ubaPlaintextOrCiphertext(i) = 1

        ElseIf ubaPlaintextOrCiphertext(i) = 1 AndAlso ubpPassword[i] = 1 Then
            ubaPlaintextOrCiphertext(i) = 1

        ElseIf ubaPlaintextOrCiphertext(i) = 1 AndAlso ubpPassword[i] = 2 Then
            ubaPlaintextOrCiphertext(i) = 1

        ElseIf ubaPlaintextOrCiphertext(i) = 2 AndAlso ubpPassword[i] = 0 Then
            ubaPlaintextOrCiphertext(i) = 2

        ElseIf ubaPlaintextOrCiphertext(i) = 2 AndAlso ubpPassword[i] = 1 Then
            ubaPlaintextOrCiphertext(i) = 2

        ElseIf ubaPlaintextOrCiphertext(i) = 2 AndAlso ubpPassword[i] = 2 Then
            ubaPlaintextOrCiphertext(i) = 0

        End If

    Next i
End Sub

/'
 0 2 2
 1 1 1
 2 0 0
'/

Sub TrinaryXOr2(ubaPlaintextOrCiphertext() As UByte,_
                ubpPassword As UByte Pointer)
    For j As LongInt = 0 To 5
        If ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 0

        ElseIf ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 2

        ElseIf ubaPlaintextOrCiphertext(j) = 0 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 2

        ElseIf ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 1

        ElseIf ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 1

        ElseIf ubaPlaintextOrCiphertext(j) = 1 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 1

        ElseIf ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 0 Then
            ubaPlaintextOrCiphertext(j) = 2

        ElseIf ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 1 Then
            ubaPlaintextOrCiphertext(j) = 0

        ElseIf ubaPlaintextOrCiphertext(j) = 2 AndAlso ubpPassword[j] = 2 Then
            ubaPlaintextOrCiphertext(j) = 0

        End If

    Next j
End Sub

/'
 2 0 0
 1 1 1
 0 2 2
'/

Sub TrinaryXAnd0(ubaPlaintextOrCiphertext() As UByte,_
                 ubpPassword As UByte Pointer)
    For k As LongInt = 0 To 5
        If ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 2

        ElseIf ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 0

        ElseIf ubaPlaintextOrCiphertext(k) = 0 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 0

        ElseIf ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 1

        ElseIf ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 1

        ElseIf ubaPlaintextOrCiphertext(k) = 1 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 1

        ElseIf ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 0 Then
            ubaPlaintextOrCiphertext(k) = 0

        ElseIf ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 1 Then
            ubaPlaintextOrCiphertext(k) = 2

        ElseIf ubaPlaintextOrCiphertext(k) = 2 AndAlso ubpPassword[k] = 2 Then
            ubaPlaintextOrCiphertext(k) = 2

        End If

    Next k
End Sub

/'
 2 2 0
 1 1 1
 0 0 2
'/

Sub TrinaryXAnd2(ubaPlaintextOrCiphertext() As UByte,_
                 ubpPassword As UByte Pointer)
    For l As LongInt = 0 To 5
        If ubaPlaintextOrCiphertext(l) = 0 AndAlso ubpPassword[l] = 0 Then
            ubaPlaintextOrCiphertext(l) = 2

        ElseIf ubaPlaintextOrCiphertext(l) = 0 AndAlso ubpPassword[l] = 1 Then
            ubaPlaintextOrCiphertext(l) = 2

        ElseIf ubaPlaintextOrCiphertext(l) = 0 AndAlso ubpPassword[l] = 2 Then
            ubaPlaintextOrCiphertext(l) = 0

        ElseIf ubaPlaintextOrCiphertext(l) = 1 AndAlso ubpPassword[l] = 0 Then
            ubaPlaintextOrCiphertext(l) = 1

        ElseIf ubaPlaintextOrCiphertext(l) = 1 AndAlso ubpPassword[l] = 1 Then
            ubaPlaintextOrCiphertext(l) = 1

        ElseIf ubaPlaintextOrCiphertext(l) = 1 AndAlso ubpPassword[l] = 2 Then
            ubaPlaintextOrCiphertext(l) = 1

        ElseIf ubaPlaintextOrCiphertext(l) = 2 AndAlso ubpPassword[l] = 0 Then
            ubaPlaintextOrCiphertext(l) = 0

        ElseIf ubaPlaintextOrCiphertext(l) = 2 AndAlso ubpPassword[l] = 1 Then
            ubaPlaintextOrCiphertext(l) = 0

        ElseIf ubaPlaintextOrCiphertext(l) = 2 AndAlso ubpPassword[l] = 2 Then
            ubaPlaintextOrCiphertext(l) = 2

        End If

    Next l
End Sub

Sub Main()
    Dim As UByte ubCLAA = 1, ubaPassword(), ubaPlaintextOrCiphertext(5)

    Dim As String strPassword

    Dim As LongInt lFileSize, lPasswordLength, k = 0

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

    ElseIf Command(1) = "-e" OrElse Command(1) = "-E" Then
        lFileSize = FileLen(Command(2))

        If lFileSize = 0 Then
            Print "There is no data in file [" & Command(2) & "], 0 byte."

            End -1

        End If

        ubpPlaintext = New UByte[lFileSize]

        Open Command(2) For Binary Access Read As #3

        Get #3, , *ubpPlaintext, lFileSize

        Close #3

        uspCiphertext = New UShort[lFileSize]

        strPassword = Command(4)

        lPasswordLength = Len(Command(4))

        ReDim ubaPassword(lPasswordLength - 1, 5)

        For i As LongInt = 0 To lPasswordLength - 1
            Tirnary(@ubaPassword(i, 0), strPassword[i])

        Next i

        For j As LongInt = 0 To lFileSize - 1
            Tirnary(@ubaPlaintextOrCiphertext(0), ubpPlaintext[j])

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            /'TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))'/

            uspCiphertext[j] = 243 * ubaPlaintextOrCiphertext(0) + 81 * ubaPlaintextOrCiphertext(1) + 27 * ubaPlaintextOrCiphertext(2) + 9 * ubaPlaintextOrCiphertext(3) + 3 * ubaPlaintextOrCiphertext(4) + ubaPlaintextOrCiphertext(5)

            k = (k + 1) Mod lPasswordLength

        Next j

        Delete ubpPlaintext

        Open Command(3) For Binary Access Write As #4

        Put #4, , *uspCiphertext, lFileSize

        Close #4

        Delete uspCiphertext

    ElseIf Command(1) = "-d" OrElse Command(1) = "-D" Then
        lFileSize = FileLen(Command(2)) \ 2

        If lFileSize = 0 Then
            Print "There is no data in file [" & Command(2) & "], 0 byte."

            End -1

        End If

        uspCiphertext = New UShort[lFileSize]

        Open Command(2) For Binary Access Read As #3

        Get #3, , *uspCiphertext, lFileSize

        Close #3

        ubpPlaintext = New UByte[lFileSize]

        strPassword = Command(4)

        lPasswordLength = Len(Command(4))

        ReDim ubaPassword(lPasswordLength - 1, 5)

        For i As LongInt = 0 To lPasswordLength - 1
            Tirnary(@ubaPassword(i, 0), strPassword[i])

        Next i

        For j As LongInt = 0 To lFileSize - 1
            Tirnary(@ubaPlaintextOrCiphertext(0), uspCiphertext[j])

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            /'TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXAnd0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))


            TrinaryXOr0(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXOr2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))

            TrinaryXAnd2(ubaPlaintextOrCiphertext(), @ubaPassword(k, 0))'/

            ubpPlaintext[j] = 243 * ubaPlaintextOrCiphertext(0) + 81 * ubaPlaintextOrCiphertext(1) + 27 * ubaPlaintextOrCiphertext(2) + 9 * ubaPlaintextOrCiphertext(3) + 3 * ubaPlaintextOrCiphertext(4) + ubaPlaintextOrCiphertext(5)

            k = (k + 1) Mod lPasswordLength
        Next j

        Delete uspCiphertext

        Open Command(3) For Binary Access Write As #4

        Put #4, , *ubpPlaintext, lFileSize

        Close #4

        Delete ubpPlaintext

    Else
        Usage()

    End If
End Sub

Main()