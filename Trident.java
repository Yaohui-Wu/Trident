/************************************************************
* 作者：伍耀晖              Author: Geek.Zhiyuan            *
* 开源日期：2022年7月7日    Open Source Date: 2022-7-7      *
* 国家城市：中国广州        City, Country: GuangZhou, China *
************************************************************/

import java.io.*;

public class Trident
{
    private static void Usage()
    {
        System.out.println("Usage\n\tEncryption: java Trident -e/-E Plaintext.file Ciphertext.file Password\n\tDecryption: java Trident -d/-D Ciphertext.file Plaintext.file Password");
    }

    private static void Trinary(byte[] baTrinary,
                                int iNumeric)
    {
        baTrinary[0] = baTrinary[1] = baTrinary[2] = baTrinary[3] = baTrinary[4] = baTrinary[5] =  0;

        if (iNumeric != 0)
        {
            for (int i = 5; i >= 0; --i)
            {
                baTrinary[i] = (byte)(iNumeric % 3);

                iNumeric /= 3;
            }
        }
    }

// 0 0 2
// 1 1 1
// 2 2 0

    private static void TrinaryXOr0(byte[] baCiphertextOrPlaintext,
                                    byte[] baPassword)
    {
        for (int j = 0; j < 6; ++j)
        {
            if (baCiphertextOrPlaintext[j] == 0 && baPassword[j] == 0)
            {
                baCiphertextOrPlaintext[j] = 0;
            }
            else if (baCiphertextOrPlaintext[j] == 0 && baPassword[j] == 1)
            {
                baCiphertextOrPlaintext[j] = 0;
            }
            else if (baCiphertextOrPlaintext[j] == 0 && baPassword[j] == 2)
            {
                baCiphertextOrPlaintext[j] = 2;
            }
            else if (baCiphertextOrPlaintext[j] == 1 && baPassword[j] == 0)
            {
                baCiphertextOrPlaintext[j] = 1;
            }
            else if (baCiphertextOrPlaintext[j] == 1 && baPassword[j] == 1)
            {
                baCiphertextOrPlaintext[j] = 1;
            }
            else if (baCiphertextOrPlaintext[j] == 1 && baPassword[j] == 2)
            {
                baCiphertextOrPlaintext[j] = 1;
            }
            else if (baCiphertextOrPlaintext[j] == 2 && baPassword[j] == 0)
            {
                baCiphertextOrPlaintext[j] = 2;
            }
            else if (baCiphertextOrPlaintext[j] == 2 && baPassword[j] == 1)
            {
                baCiphertextOrPlaintext[j] = 2;
            }
            else if (baCiphertextOrPlaintext[j] == 2 && baPassword[j] == 2)
            {
                baCiphertextOrPlaintext[j] = 0;
            }
        }
    }

// 0 2 2
// 1 1 1
// 2 0 0

    private static void TrinaryXOr2(byte[] baCiphertextOrPlaintext,
                                    byte[] baPassword)
    {
        for (int j = 0; j < 6; ++j)
        {
            if (baCiphertextOrPlaintext[j] == 0 && baPassword[j] == 0)
            {
                baCiphertextOrPlaintext[j] = 0;
            }
            else if (baCiphertextOrPlaintext[j] == 0 && baPassword[j] == 1)
            {
                baCiphertextOrPlaintext[j] = 2;
            }
            else if (baCiphertextOrPlaintext[j] == 0 && baPassword[j] == 2)
            {
                baCiphertextOrPlaintext[j] = 2;
            }
            else if (baCiphertextOrPlaintext[j] == 1 && baPassword[j] == 0)
            {
                baCiphertextOrPlaintext[j] = 1;
            }
            else if (baCiphertextOrPlaintext[j] == 1 && baPassword[j] == 1)
            {
                baCiphertextOrPlaintext[j] = 1;
            }
            else if (baCiphertextOrPlaintext[j] == 1 && baPassword[j] == 2)
            {
                baCiphertextOrPlaintext[j] = 1;
            }
            else if (baCiphertextOrPlaintext[j] == 2 && baPassword[j] == 0)
            {
                baCiphertextOrPlaintext[j] = 2;
            }
            else if (baCiphertextOrPlaintext[j] == 2 && baPassword[j] == 1)
            {
                baCiphertextOrPlaintext[j] = 0;
            }
            else if (baCiphertextOrPlaintext[j] == 2 && baPassword[j] == 2)
            {
                baCiphertextOrPlaintext[j] = 0;
            }
        }
    }

// 2 0 0
// 1 1 1
// 0 2 2

    private static void TrinaryXAnd0(byte[] baCiphertextOrPlaintext,
                                     byte[] baPassword)
    {
        for (int k = 0; k < 6; ++k)
        {
            if (baCiphertextOrPlaintext[k] == 0 && baPassword[k] == 0)
            {
                baCiphertextOrPlaintext[k] = 2;
            }
            else if (baCiphertextOrPlaintext[k] == 0 && baPassword[k] == 1)
            {
                baCiphertextOrPlaintext[k] = 0;
            }
            else if (baCiphertextOrPlaintext[k] == 0 && baPassword[k] == 2)
            {
                baCiphertextOrPlaintext[k] = 0;
            }
            else if (baCiphertextOrPlaintext[k] == 1 && baPassword[k] == 0)
            {
                baCiphertextOrPlaintext[k] = 1;
            }
            else if (baCiphertextOrPlaintext[k] == 1 && baPassword[k] == 1)
            {
                baCiphertextOrPlaintext[k] = 1;
            }
            else if (baCiphertextOrPlaintext[k] == 1 && baPassword[k] == 2)
            {
                baCiphertextOrPlaintext[k] = 1;
            }
            else if (baCiphertextOrPlaintext[k] == 2 && baPassword[k] == 0)
            {
                baCiphertextOrPlaintext[k] = 0;
            }
            else if (baCiphertextOrPlaintext[k] == 2 && baPassword[k] == 1)
            {
                baCiphertextOrPlaintext[k] = 2;
            }
            else if (baCiphertextOrPlaintext[k] == 2 && baPassword[k] == 2)
            {
                baCiphertextOrPlaintext[k] = 2;
            }
        }
    }

// 2 2 0
// 1 1 1
// 0 0 2

    private static void TrinaryXAnd2(byte[] baCiphertextOrPlaintext,
                                     byte[] baPassword)
    {
        for (int k = 0; k < 6; ++k)
        {
            if (baCiphertextOrPlaintext[k] == 0 && baPassword[k] == 0)
            {
                baCiphertextOrPlaintext[k] = 2;
            }
            else if (baCiphertextOrPlaintext[k] == 0 && baPassword[k] == 1)
            {
                baCiphertextOrPlaintext[k] = 2;
            }
            else if (baCiphertextOrPlaintext[k] == 0 && baPassword[k] == 2)
            {
                baCiphertextOrPlaintext[k] = 0;
            }
            else if (baCiphertextOrPlaintext[k] == 1 && baPassword[k] == 0)
            {
                baCiphertextOrPlaintext[k] = 1;
            }
            else if (baCiphertextOrPlaintext[k] == 1 && baPassword[k] == 1)
            {
                baCiphertextOrPlaintext[k] = 1;
            }
            else if (baCiphertextOrPlaintext[k] == 1 && baPassword[k] == 2)
            {
                baCiphertextOrPlaintext[k] = 1;
            }
            else if (baCiphertextOrPlaintext[k] == 2 && baPassword[k] == 0)
            {
                baCiphertextOrPlaintext[k] = 0;
            }
            else if (baCiphertextOrPlaintext[k] == 2 && baPassword[k] == 1)
            {
                baCiphertextOrPlaintext[k] = 0;
            }
            else if (baCiphertextOrPlaintext[k] == 2 && baPassword[k] == 2)
            {
                baCiphertextOrPlaintext[k] = 2;
            }
        }
    }

    public static void main(String[] args)
    {
        if (args.length != 4)
        {
            Usage();
        }
        else if (args[0].equals("-e") || args[0].equals("-E"))
        {
            RandomAccessFile rafPlaintext = null, rafCiphertext = null;

            try
            {
                rafPlaintext = new RandomAccessFile(args[1], "r");

                rafCiphertext = new RandomAccessFile(args[2], "rw");

                long lFileSize = rafPlaintext.length();

                if (lFileSize == 0)
                {
                    System.out.printf("There is no data in file [%s], 0 byte.\n", args[1]);

                    System.exit(-1);
                }

                rafCiphertext.setLength(2 * lFileSize);

                byte[] baPlaintextOrCiphertext = new byte[6];

                int iPasswordLength = args[3].length();

                byte[][] baPassword = new byte[iPasswordLength][6];

                for (int i = 0; i < iPasswordLength; ++i)
                {
                    Trinary(baPassword[i], args[3].getBytes()[i]);
                }

                int k = 0;

                for (long j = 0; j < lFileSize; ++j)
                {
                    Trinary(baPlaintextOrCiphertext, rafPlaintext.readUnsignedByte());

                    TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

                    /*TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXOr0(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXOr2(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXAnd0(baPlaintextOrCiphertext, baPassword[k]);

                    TrinaryXAnd2(baPlaintextOrCiphertext, baPassword[k]);*/

                    rafCiphertext.writeShort(243 * baPlaintextOrCiphertext[0] + 81 * baPlaintextOrCiphertext[1] + 27 * baPlaintextOrCiphertext[2] + 9 * baPlaintextOrCiphertext[3] + 3 * baPlaintextOrCiphertext[4] + baPlaintextOrCiphertext[5]);

                    k = ++k % iPasswordLength;
                }              
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
            finally
            {
                try
                {
                    if (rafCiphertext != null)
                    {
                        rafCiphertext.close();
                    }

                    if (rafPlaintext != null)
                    {
                        rafPlaintext.close();
                    }
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
            }
        }
        else if (args[0].equals("-d") || args[0].equals("-D"))
        {
            RandomAccessFile rafCiphertext = null, rafPlaintext = null;

            try
            {
                rafCiphertext = new RandomAccessFile(args[1], "r");

                rafPlaintext = new RandomAccessFile(args[2], "rw");

                long lFileSize = rafCiphertext.length() / 2;

                if (lFileSize == 0)
                {
                    System.out.printf("There is no data in file [%s], 0 byte.\n", args[1]);

                    System.exit(-1);
                }

                rafPlaintext.setLength(lFileSize);

                byte[] baCiphertextOrPlaintext = new byte[6];

                int iPasswordLength = args[3].length();

                byte[][] baPassword = new byte[iPasswordLength][6];

                for (int i = 0; i < iPasswordLength; ++i)
                {
                    Trinary(baPassword[i], args[3].getBytes()[i]);
                }

                int k = 0;

                for (long j = 0; j < lFileSize; ++j)
                {
                    Trinary(baCiphertextOrPlaintext, rafCiphertext.readUnsignedShort());

                    TrinaryXAnd0(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXOr2(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXOr0(baCiphertextOrPlaintext, baPassword[k]);

                    /*TrinaryXAnd2(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXOr2(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXOr0(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXAnd2(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXAnd0(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXOr0(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXAnd2(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXAnd0(baCiphertextOrPlaintext, baPassword[k]);

                    TrinaryXOr2(baCiphertextOrPlaintext, baPassword[k]);*/

                    rafPlaintext.writeByte(243 * baCiphertextOrPlaintext[0] + 81 * baCiphertextOrPlaintext[1] + 27 * baCiphertextOrPlaintext[2] + 9 * baCiphertextOrPlaintext[3] + 3 * baCiphertextOrPlaintext[4] + baCiphertextOrPlaintext[5]);

                    k = ++k % iPasswordLength;
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
            finally
            {
                try
                {
                    if (rafPlaintext != null)
                    {
                        rafPlaintext.close();
                    }

                    if (rafCiphertext != null)
                    {
                        rafCiphertext.close();
                    }
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
            }
        }
        else
        {
            Usage();
        }
    }
}