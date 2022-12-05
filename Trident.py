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

def TrinaryXOr0(lTrinary, lPassword):
    for j in range(6):
       if lTrinary[j] == lPassword[j] == 0: lTrinary[j] = 0

       elif lTrinary[j] == 0 and lPassword[j] == 1: lTrinary[j] = 0

       elif lTrinary[j] == 0 and lPassword[j] == 2: lTrinary[j] = 2

       elif lTrinary[j] == 1 and lPassword[j] == 0: lTrinary[j] = 1

       elif lTrinary[j] == lPassword[j] == 1: lTrinary[j] = 1

       elif lTrinary[j] == 1 and lPassword[j] == 2: lTrinary[j] = 1

       elif lTrinary[j] == 2 and lPassword[j] == 0: lTrinary[j] = 2

       elif lTrinary[j] == 2 and lPassword[j] == 1: lTrinary[j] = 2

       elif lTrinary[j] == lPassword[j] == 2: lTrinary[j] = 0

# 0 2 2
# 1 1 1
# 2 0 0

def TrinaryXOr2(lTrinary, lPassword):
    for j in range(6):
       if lTrinary[j] == lPassword[j] == 0: lTrinary[j] = 0

       elif lTrinary[j] == 0 and lPassword[j] == 1: lTrinary[j] = 2

       elif lTrinary[j] == 0 and lPassword[j] == 2: lTrinary[j] = 2

       elif lTrinary[j] == 1 and lPassword[j] == 0: lTrinary[j] = 1

       elif lTrinary[j] == lPassword[j] == 1: lTrinary[j] = 1

       elif lTrinary[j] == 1 and lPassword[j] == 2: lTrinary[j] = 1

       elif lTrinary[j] == 2 and lPassword[j] == 0: lTrinary[j] = 2

       elif lTrinary[j] == 2 and lPassword[j] == 1: lTrinary[j] = 0

       elif lTrinary[j] == lPassword[j] == 2: lTrinary[j] = 0

# 2 0 0
# 1 1 1
# 0 2 2

def TrinaryXAnd0(lTrinary, lPassword):
    for k in range(6):
       if lTrinary[k] == lPassword[k] == 0: lTrinary[k] = 2

       elif lTrinary[k] == 0 and lPassword[k] == 1: lTrinary[k] = 0

       elif lTrinary[k] == 0 and lPassword[k] == 2: lTrinary[k] = 0

       elif lTrinary[k] == 1 and lPassword[k] == 0: lTrinary[k] = 1

       elif lTrinary[k] == lPassword[k] == 1: lTrinary[k] = 1

       elif lTrinary[k] == 1 and lPassword[k] == 2: lTrinary[k] = 1

       elif lTrinary[k] == 2 and lPassword[k] == 0: lTrinary[k] = 0

       elif lTrinary[k] == 2 and lPassword[k] == 1: lTrinary[k] = 2

       elif lTrinary[k] == lPassword[k] == 2: lTrinary[k] = 2

# 2 2 0
# 1 1 1
# 0 0 2

def TrinaryXAnd2(lTrinary, lPassword):
    for k in range(6):
       if lTrinary[k] == lPassword[k] == 0: lTrinary[k] = 2

       elif lTrinary[k] == 0 and lPassword[k] == 1: lTrinary[k] = 2

       elif lTrinary[k] == 0 and lPassword[k] == 2: lTrinary[k] = 0

       elif lTrinary[k] == 1 and lPassword[k] == 0: lTrinary[k] = 1

       elif lTrinary[k] == lPassword[k] == 1: lTrinary[k] = 1

       elif lTrinary[k] == 1 and lPassword[k] == 2: lTrinary[k] = 1

       elif lTrinary[k] == 2 and lPassword[k] == 0: lTrinary[k] = 0

       elif lTrinary[k] == 2 and lPassword[k] == 1: lTrinary[k] = 0

       elif lTrinary[k] == lPassword[k] == 2: lTrinary[k] = 2

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

        iPasswordLength, lTrinary = len(strPassword), [0] * 6

        k, baCiphertext = 0, bytearray(2 * iFileSize)

        for i in range(iPasswordLength):
            lPassword.append([0] * 6)

            Trinary(lPassword[i], ord(strPassword[i]))

        for j in range(iFileSize):
            Trinary(lTrinary, bPlaintext[j])

            TrinaryXOr0(lTrinary, lPassword[k])

            TrinaryXOr2(lTrinary, lPassword[k])

            TrinaryXAnd0(lTrinary, lPassword[k])

            #TrinaryXOr0(lTrinary, lPassword[k])

            #TrinaryXOr2(lTrinary, lPassword[k])

            #TrinaryXAnd2(lTrinary, lPassword[k])

            #TrinaryXOr0(lTrinary, lPassword[k])

            #TrinaryXAnd0(lTrinary, lPassword[k])

            #TrinaryXAnd2(lTrinary, lPassword[k])

            #TrinaryXOr2(lTrinary, lPassword[k])

            #TrinaryXAnd0(lTrinary, lPassword[k])

            #TrinaryXAnd2(lTrinary, lPassword[k])

            iData = 243 * lTrinary[0] + 81 * lTrinary[1] + 27 * lTrinary[2] + 9 * lTrinary[3] + 3 * lTrinary[4] + lTrinary[5]

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

        iPasswordLength, lTrinary = len(strPassword), [0] * 6

        k, baPlaintext = 0, bytearray(iFileSize)

        for i in range(iPasswordLength):
            lPassword.append([0] * 6)

            Trinary(lPassword[i], ord(strPassword[i]))

        for j in range(iFileSize):
            Trinary(lTrinary, bCiphertext[2 * j] + (bCiphertext[2 * j + 1] << 8))

            TrinaryXAnd0(lTrinary, lPassword[k])

            TrinaryXOr2(lTrinary, lPassword[k])

            TrinaryXOr0(lTrinary, lPassword[k])

            #TrinaryXAnd2(lTrinary, lPassword[k])

            #TrinaryXOr2(lTrinary, lPassword[k])

            #TrinaryXOr0(lTrinary, lPassword[k])

            #TrinaryXAnd2(lTrinary, lPassword[k])

            #TrinaryXAnd0(lTrinary, lPassword[k])

            #TrinaryXOr0(lTrinary, lPassword[k])

            #TrinaryXAnd2(lTrinary, lPassword[k])

            #TrinaryXAnd0(lTrinary, lPassword[k])

            #TrinaryXOr2(lTrinary, lPassword[k])

            baPlaintext[j] = 243 * lTrinary[0] + 81 * lTrinary[1] + 27 * lTrinary[2] + 9 * lTrinary[3] + 3 * lTrinary[4] + lTrinary[5]

            k = (k + 1) % iPasswordLength

        with open(sys.argv[3], "bw") as fdPlaintext:
            fdPlaintext.write(baPlaintext)

    else: Usage()