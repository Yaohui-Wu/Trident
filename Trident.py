#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#************************************************************
# 作者：伍耀晖              Author: Geek.Zhiyuan            *
# 开源日期：2022年7月7日    Open Source Date: 2022-7-7      *
# 国家城市：中国广州        City, Country: GuangZhou, China *
#************************************************************

import sys

def Usage():
    print("Usage\n\tEncryption: python Trident.py -e/-E Plaintext.file Ciphertext.file Password\n\tDecryption: python Trident.py -d/-D Ciphertext.file Plaintext.file Password")

def Trinary(lTrinary, iNumeric):
    lTrinary[0] = lTrinary[1] = lTrinary[2] = lTrinary[3] = lTrinary[4] = lTrinary[5] = 0

    if iNumeric != 0:
        for i in range(5, -1, -1):
            iNumeric, lTrinary[i] = divmod(iNumeric, 3)

# 0 0 2
# 1 1 1
# 2 2 0

def TrinaryXOr0(lPlaintextOrCiphertext, lPassword):
    for i in range(6):
       if lPlaintextOrCiphertext[i] == lPassword[i] == 0: lPlaintextOrCiphertext[i] = 0

       elif lPlaintextOrCiphertext[i] == 0 and lPassword[i] == 1: lPlaintextOrCiphertext[i] = 0

       elif lPlaintextOrCiphertext[i] == 0 and lPassword[i] == 2: lPlaintextOrCiphertext[i] = 2

       elif lPlaintextOrCiphertext[i] == 1 and lPassword[i] == 0: lPlaintextOrCiphertext[i] = 1

       elif lPlaintextOrCiphertext[i] == lPassword[i] == 1: lPlaintextOrCiphertext[i] = 1

       elif lPlaintextOrCiphertext[i] == 1 and lPassword[i] == 2: lPlaintextOrCiphertext[i] = 1

       elif lPlaintextOrCiphertext[i] == 2 and lPassword[i] == 0: lPlaintextOrCiphertext[i] = 2

       elif lPlaintextOrCiphertext[i] == 2 and lPassword[i] == 1: lPlaintextOrCiphertext[i] = 2

       elif lPlaintextOrCiphertext[i] == lPassword[i] == 2: lPlaintextOrCiphertext[i] = 0

# 0 2 2
# 1 1 1
# 2 0 0

def TrinaryXOr2(lPlaintextOrCiphertext, lPassword):
    for j in range(6):
       if lPlaintextOrCiphertext[j] == lPassword[j] == 0: lPlaintextOrCiphertext[j] = 0

       elif lPlaintextOrCiphertext[j] == 0 and lPassword[j] == 1: lPlaintextOrCiphertext[j] = 2

       elif lPlaintextOrCiphertext[j] == 0 and lPassword[j] == 2: lPlaintextOrCiphertext[j] = 2

       elif lPlaintextOrCiphertext[j] == 1 and lPassword[j] == 0: lPlaintextOrCiphertext[j] = 1

       elif lPlaintextOrCiphertext[j] == lPassword[j] == 1: lPlaintextOrCiphertext[j] = 1

       elif lPlaintextOrCiphertext[j] == 1 and lPassword[j] == 2: lPlaintextOrCiphertext[j] = 1

       elif lPlaintextOrCiphertext[j] == 2 and lPassword[j] == 0: lPlaintextOrCiphertext[j] = 2

       elif lPlaintextOrCiphertext[j] == 2 and lPassword[j] == 1: lPlaintextOrCiphertext[j] = 0

       elif lPlaintextOrCiphertext[j] == lPassword[j] == 2: lPlaintextOrCiphertext[j] = 0

# 2 0 0
# 1 1 1
# 0 2 2

def TrinaryXAnd0(lPlaintextOrCiphertext, lPassword):
    for k in range(6):
       if lPlaintextOrCiphertext[k] == lPassword[k] == 0: lPlaintextOrCiphertext[k] = 2

       elif lPlaintextOrCiphertext[k] == 0 and lPassword[k] == 1: lPlaintextOrCiphertext[k] = 0

       elif lPlaintextOrCiphertext[k] == 0 and lPassword[k] == 2: lPlaintextOrCiphertext[k] = 0

       elif lPlaintextOrCiphertext[k] == 1 and lPassword[k] == 0: lPlaintextOrCiphertext[k] = 1

       elif lPlaintextOrCiphertext[k] == lPassword[k] == 1: lPlaintextOrCiphertext[k] = 1

       elif lPlaintextOrCiphertext[k] == 1 and lPassword[k] == 2: lPlaintextOrCiphertext[k] = 1

       elif lPlaintextOrCiphertext[k] == 2 and lPassword[k] == 0: lPlaintextOrCiphertext[k] = 0

       elif lPlaintextOrCiphertext[k] == 2 and lPassword[k] == 1: lPlaintextOrCiphertext[k] = 2

       elif lPlaintextOrCiphertext[k] == lPassword[k] == 2: lPlaintextOrCiphertext[k] = 2

# 2 2 0
# 1 1 1
# 0 0 2

def TrinaryXAnd2(lPlaintextOrCiphertext, lPassword):
    for l in range(6):
       if lPlaintextOrCiphertext[l] == lPassword[l] == 0: lPlaintextOrCiphertext[l] = 2

       elif lPlaintextOrCiphertext[l] == 0 and lPassword[l] == 1: lPlaintextOrCiphertext[l] = 2

       elif lPlaintextOrCiphertext[l] == 0 and lPassword[l] == 2: lPlaintextOrCiphertext[l] = 0

       elif lPlaintextOrCiphertext[l] == 1 and lPassword[l] == 0: lPlaintextOrCiphertext[l] = 1

       elif lPlaintextOrCiphertext[l] == lPassword[l] == 1: lPlaintextOrCiphertext[l] = 1

       elif lPlaintextOrCiphertext[l] == 1 and lPassword[l] == 2: lPlaintextOrCiphertext[l] = 1

       elif lPlaintextOrCiphertext[l] == 2 and lPassword[l] == 0: lPlaintextOrCiphertext[l] = 0

       elif lPlaintextOrCiphertext[l] == 2 and lPassword[l] == 1: lPlaintextOrCiphertext[l] = 0

       elif lPlaintextOrCiphertext[l] == lPassword[l] == 2: lPlaintextOrCiphertext[l] = 2

if __name__ == "__main__":
    if len(sys.argv) != 5: Usage()

    elif sys.argv[1] == "-e" or sys.argv[1] == "-E":
        with open(sys.argv[2], "br") as fdPlaintext:
            bPlaintext = fdPlaintext.read()

            iFileSize = fdPlaintext.tell()

        if iFileSize == 0:
            print("There is no data in file [{}], 0 byte.".format(sys.argv[2]))

            exit(-1)

        strPassword, lPassword = sys.argv[4], []

        iPasswordLength, lPlaintextOrCiphertext = len(strPassword), [0] * 6

        k, baCiphertext = 0, bytearray(2 * iFileSize)

        for i in range(iPasswordLength):
            lPassword.append([0] * 6)

            Trinary(lPassword[i], ord(strPassword[i]))

        for j in range(iFileSize):
            Trinary(lPlaintextOrCiphertext, bPlaintext[j])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])


            """TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXAnd0(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])


            TrinaryXAnd2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr2(lPlaintextOrCiphertext, lPassword[k])

            TrinaryXOr0(lPlaintextOrCiphertext, lPassword[k])"""

            iData = 243 * lPlaintextOrCiphertext[0] + 81 * lPlaintextOrCiphertext[1] + 27 * lPlaintextOrCiphertext[2] + 9 * lPlaintextOrCiphertext[3] + 3 * lPlaintextOrCiphertext[4] + lPlaintextOrCiphertext[5]

            baCiphertext[2 * j : 2 * j + 2] = iData.to_bytes(2, "little")

            k = (k + 1) % iPasswordLength

        with open(sys.argv[3], "bw") as fdCiphertext:
            fdCiphertext.write(baCiphertext)

    elif sys.argv[1] == "-d" or sys.argv[1] == "-D":
        with open(sys.argv[2], "br") as fdCiphertext:
            bCiphertext = fdCiphertext.read()

            iFileSize = fdCiphertext.tell() // 2

        if iFileSize == 0:
            print("There is no data in file [{}], 0 byte.".format(sys.argv[2]))

            exit(-1)

        strPassword, lPassword = sys.argv[4], []

        iPasswordLength, lCiphertextOrPlaintext = len(strPassword), [0] * 6

        k, baPlaintext = 0, bytearray(iFileSize)

        for i in range(iPasswordLength):
            lPassword.append([0] * 6)

            Trinary(lPassword[i], ord(strPassword[i]))

        for j in range(iFileSize):
            Trinary(lCiphertextOrPlaintext, bCiphertext[2 * j] + (bCiphertext[2 * j + 1] << 8))

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])


            """TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXAnd0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])


            TrinaryXOr0(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXOr2(lCiphertextOrPlaintext, lPassword[k])

            TrinaryXAnd2(lCiphertextOrPlaintext, lPassword[k])"""

            baPlaintext[j] = 243 * lCiphertextOrPlaintext[0] + 81 * lCiphertextOrPlaintext[1] + 27 * lCiphertextOrPlaintext[2] + 9 * lCiphertextOrPlaintext[3] + 3 * lCiphertextOrPlaintext[4] + lCiphertextOrPlaintext[5]

            k = (k + 1) % iPasswordLength

        with open(sys.argv[3], "bw") as fdPlaintext:
            fdPlaintext.write(baPlaintext)

    else: Usage()