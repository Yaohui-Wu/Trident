(************************************************************
* 作者：伍耀晖              Author: Geek.Zhiyuan            *
* 开源日期：2022年7月7日    Open Source Date: 2022-7-7      *
* 国家城市：中国广州        City, Country: GuangZhou, China *
************************************************************)
(* Compiled by free pascal. free pascal website: www.freepascal.org *)

Program Trident;

Type
   Trinary6A = Array[0..5] Of Byte;

Procedure Usage();
Begin
    Writeln('Usage'#10#9'Encryption: Trident -e/-E Plaintext.file Ciphertext.file Password'#10#9'Decryption: Trident -d/-D Ciphertext.file Plaintext.file Password');
End;

Procedure Trinary(Var baTrinary : Trinary6A;
                  lNumeric : Int64);
Var
    i : Int64;

Begin
    baTrinary[0] := 0;

    baTrinary[1] := 0;

    baTrinary[2] := 0;

    baTrinary[3] := 0;

    baTrinary[4] := 0;

    baTrinary[5] := 0;

    If lNumeric <> 0 Then
    Begin
        For i := 5 DownTo 0 Do
        Begin
            baTrinary[i] := lNumeric Mod 3;

            lNumeric := lNumeric Div 3;
        End;
    End;
End;

(*
 0 0 2
 1 1 1
 2 2 0
*)

Procedure TrinaryXOr0(Var baPlaintextOrCiphertext : Trinary6A;
                      Var baPassword : Trinary6A);
Var
    i : Int64;

Begin
    For i := 0 To 5 Do
    Begin
        If (baPlaintextOrCiphertext[i] = 0) And (baPassword[i] = 0) Then
        Begin
            baPlaintextOrCiphertext[i] := 0;
        End

        Else If (baPlaintextOrCiphertext[i] = 0) And (baPassword[i] = 1) Then
        Begin
            baPlaintextOrCiphertext[i] := 0;
        End

        Else If (baPlaintextOrCiphertext[i] = 0) And (baPassword[i] = 2) Then
        Begin
            baPlaintextOrCiphertext[i] := 2;
        End

        Else If (baPlaintextOrCiphertext[i] = 1) And (baPassword[i] = 0) Then
        Begin
            baPlaintextOrCiphertext[i] := 1;
        End

        Else If (baPlaintextOrCiphertext[i] = 1) And (baPassword[i] = 1) Then
        Begin
            baPlaintextOrCiphertext[i] := 1;
        End

        Else If (baPlaintextOrCiphertext[i] = 1) And (baPassword[i] = 2) Then
        Begin
            baPlaintextOrCiphertext[i] := 1;
        End

        Else If (baPlaintextOrCiphertext[i] = 2) And (baPassword[i] = 0) Then
        Begin
            baPlaintextOrCiphertext[i] := 2;
        End

        Else If (baPlaintextOrCiphertext[i] = 2) And (baPassword[i] = 1) Then
        Begin
            baPlaintextOrCiphertext[i] := 2;
        End

        Else If (baPlaintextOrCiphertext[i] = 2) And (baPassword[i] = 2) Then
        Begin
            baPlaintextOrCiphertext[i] := 0;
        End
    End;
End;

(*
 0 2 2
 1 1 1
 2 0 0
*)

Procedure TrinaryXOr2(Var baPlaintextOrCiphertext : Trinary6A;
                      Var baPassword : Trinary6A);
Var
    j : Int64;

Begin
    For j := 0 To 5 Do
    Begin
        If (baPlaintextOrCiphertext[j] = 0) And (baPassword[j] = 0) Then
        Begin
            baPlaintextOrCiphertext[j] := 0;
        End

        Else If (baPlaintextOrCiphertext[j] = 0) And (baPassword[j] = 1) Then
        Begin
            baPlaintextOrCiphertext[j] := 2;
        End

        Else If (baPlaintextOrCiphertext[j] = 0) And (baPassword[j] = 2) Then
        Begin
            baPlaintextOrCiphertext[j] := 2;
        End

        Else If (baPlaintextOrCiphertext[j] = 1) And (baPassword[j] = 0) Then
        Begin
            baPlaintextOrCiphertext[j] := 1;
        End

        Else If (baPlaintextOrCiphertext[j] = 1) And (baPassword[j] = 1) Then
        Begin
            baPlaintextOrCiphertext[j] := 1;
        End

        Else If (baPlaintextOrCiphertext[j] = 1) And (baPassword[j] = 2) Then
        Begin
            baPlaintextOrCiphertext[j] := 1;
        End

        Else If (baPlaintextOrCiphertext[j] = 2) And (baPassword[j] = 0) Then
        Begin
            baPlaintextOrCiphertext[j] := 2;
        End

        Else If (baPlaintextOrCiphertext[j] = 2) And (baPassword[j] = 1) Then
        Begin
            baPlaintextOrCiphertext[j] := 0;
        End

        Else If (baPlaintextOrCiphertext[j] = 2) And (baPassword[j] = 2) Then
        Begin
            baPlaintextOrCiphertext[j] := 0;
        End
    End;
End;

(*
 2 0 0
 1 1 1
 0 2 2
*)

Procedure TrinaryXAnd0(Var baPlaintextOrCiphertext : Trinary6A;
                       Var baPassword : Trinary6A);
Var
    k : Int64;

Begin
    For k := 0 To 5 Do
    Begin
        If (baPlaintextOrCiphertext[k] = 0) And (baPassword[k] = 0) Then
        Begin
            baPlaintextOrCiphertext[k] := 2;
        End

        Else If (baPlaintextOrCiphertext[k] = 0) And (baPassword[k] = 1) Then
        Begin
            baPlaintextOrCiphertext[k] := 0;
        End

        Else If (baPlaintextOrCiphertext[k] = 0) And (baPassword[k] = 2) Then
        Begin
            baPlaintextOrCiphertext[k] := 0;
        End

        Else If (baPlaintextOrCiphertext[k] = 1) And (baPassword[k] = 0) Then
        Begin
            baPlaintextOrCiphertext[k] := 1;
        End

        Else If (baPlaintextOrCiphertext[k] = 1) And (baPassword[k] = 1) Then
        Begin
            baPlaintextOrCiphertext[k] := 1;
        End

        Else If (baPlaintextOrCiphertext[k] = 1) And (baPassword[k] = 2) Then
        Begin
            baPlaintextOrCiphertext[k] := 1;
        End

        Else If (baPlaintextOrCiphertext[k] = 2) And (baPassword[k] = 0) Then
        Begin
            baPlaintextOrCiphertext[k] := 0;
        End

        Else If (baPlaintextOrCiphertext[k] = 2) And (baPassword[k] = 1) Then
        Begin
            baPlaintextOrCiphertext[k] := 2;
        End

        Else If (baPlaintextOrCiphertext[k] = 2) And (baPassword[k] = 2) Then
        Begin
            baPlaintextOrCiphertext[k] := 2;
        End
    End;
End;

(*
 2 2 0
 1 1 1
 0 0 2
*)

Procedure TrinaryXAnd2(Var baPlaintextOrCiphertext : Trinary6A;
                       Var baPassword : Trinary6A);
Var
    l : Int64;

Begin
    For l := 0 To 5 Do
    Begin
        If (baPlaintextOrCiphertext[l] = 0) And (baPassword[l] = 0) Then
        Begin
            baPlaintextOrCiphertext[l] := 2;
        End

        Else If (baPlaintextOrCiphertext[l] = 0) And (baPassword[l] = 1) Then
        Begin
            baPlaintextOrCiphertext[l] := 2;
        End

        Else If (baPlaintextOrCiphertext[l] = 0) And (baPassword[l] = 2) Then
        Begin
            baPlaintextOrCiphertext[l] := 0;
        End

        Else If (baPlaintextOrCiphertext[l] = 1) And (baPassword[l] = 0) Then
        Begin
            baPlaintextOrCiphertext[l] := 1;
        End

        Else If (baPlaintextOrCiphertext[l] = 1) And (baPassword[l] = 1) Then
        Begin
            baPlaintextOrCiphertext[l] := 1;
        End

        Else If (baPlaintextOrCiphertext[l] = 1) And (baPassword[l] = 2) Then
        Begin
            baPlaintextOrCiphertext[l] := 1;
        End

        Else If (baPlaintextOrCiphertext[l] = 2) And (baPassword[l] = 0) Then
        Begin
            baPlaintextOrCiphertext[l] := 0;
        End

        Else If (baPlaintextOrCiphertext[l] = 2) And (baPassword[l] = 1) Then
        Begin
            baPlaintextOrCiphertext[l] := 0;
        End

        Else If (baPlaintextOrCiphertext[l] = 2) And (baPassword[l] = 2) Then
        Begin
            baPlaintextOrCiphertext[l] := 2;
        End
    End;
End;

Var
    fdPlaintextOrCiphertext : File;

    lFileSize, lPasswordLength, i, j, k : Int64;

    bpPlaintext : PByte;

    wpCiphertext : PWord;

    baPassword : Array Of Trinary6A;

    baPlaintextOrCiphertext : Trinary6A;

Begin
    If(ParamCount <> 4) Then
    Begin
        Usage();
    End

    Else If (ParamStr(1) = '-e') Or (ParamStr(1) = '-E') Then
    Begin
        Assign(fdPlaintextOrCiphertext, ParamStr(2));

        Reset(fdPlaintextOrCiphertext, 1);

        lFileSize := FileSize(fdPlaintextOrCiphertext);

        If lFileSize = 0 Then
        Begin
            WriteLn('There is no data in file [', ParamStr(2), '], 0 byte.');

            Halt(-1);
        End;

        bpPlaintext := GetMem(lFileSize);

        BlockRead(fdPlaintextOrCiphertext, bpPlaintext^, lFileSize);

        Close(fdPlaintextOrCiphertext);

        wpCiphertext := GetMem(2 * lFileSize);

        lPasswordLength := Length(ParamStr(4));

        SetLength(baPassword, lPasswordLength);

        For i := 1 To lPasswordLength Do
        Begin
            Trinary(baPassword[i - 1], Ord(ParamStr(4)[i]));
        End;

        k := 0;

        For j := 0 To lFileSize - 1 Do
        Begin
            Trinary(baPlaintextOrCiphertext, bpPlaintext[j]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            (*TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);*)

            wpCiphertext[j] := 243 * baPlaintextOrCiphertext[0] + 81 * baPlaintextOrCiphertext[1] + 27 * baPlaintextOrCiphertext[2] + 9 * baPlaintextOrCiphertext[3] + 3 * baPlaintextOrCiphertext[4] + baPlaintextOrCiphertext[5];

            k := (k + 1) Mod lPasswordLength;
        End;

        Assign(fdPlaintextOrCiphertext, Paramstr(3));

        Rewrite(fdPlaintextOrCiphertext, 1);

        BlockWrite(fdPlaintextOrCiphertext, wpCiphertext^, 2 * lFileSize);

        Close(fdPlaintextOrCiphertext);

        FreeMem(wpCiphertext);

        FreeMem(bpPlaintext);
    End

    Else If (paramstr(1) = '-d') Or (paramstr(1) = '-D') Then
    Begin
        Assign(fdPlaintextOrCiphertext, ParamStr(2));

        Reset(fdPlaintextOrCiphertext, 1);

        lFileSize := FileSize(fdPlaintextOrCiphertext);

        If lFileSize = 0 Then
        Begin
            WriteLn('There is no data in file [', ParamStr(2), '], 0 byte.');

            Halt(-1);
        End;

        wpCiphertext := GetMem(lFileSize);

        BlockRead(fdPlaintextOrCiphertext, wpCiphertext^, lFileSize);

        Close(fdPlaintextOrCiphertext);

        lFileSize := lFileSize Div 2;

        bpPlaintext := GetMem(lFileSize);

        lPasswordLength := Length(ParamStr(4));

        SetLength(baPassword, lPasswordLength);

        For i := 1 To lPasswordLength Do
        Begin
            Trinary(baPassword[i - 1], Ord(ParamStr(4)[i]));
        End;

        k := 0;

        For j := 0 To lFileSize - 1 Do
        Begin
            Trinary(baPlaintextOrCiphertext, wpCiphertext[j]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            (*TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);


            TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

            TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);*)

            bpPlaintext[j] := 243 * baPlaintextOrCiphertext[0] + 81 * baPlaintextOrCiphertext[1] + 27 * baPlaintextOrCiphertext[2] + 9 * baPlaintextOrCiphertext[3] + 3 * baPlaintextOrCiphertext[4] + baPlaintextOrCiphertext[5];

            k := (k + 1) Mod lPasswordLength;
        End;

        Assign(fdPlaintextOrCiphertext, Paramstr(3));

        Rewrite(fdPlaintextOrCiphertext, 1);

        BlockWrite(fdPlaintextOrCiphertext, bpPlaintext^, lFileSize);

        Close(fdPlaintextOrCiphertext);

        FreeMem(bpPlaintext);

        FreeMem(wpCiphertext);
    End

    Else
    Begin
        Usage();
    End
End.