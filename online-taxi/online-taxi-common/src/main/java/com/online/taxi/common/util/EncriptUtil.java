package com.online.taxi.util;

import lombok.extern.slf4j.Slf4j;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import java.io.UnsupportedEncodingException;

/**
 * 密钥
 *
 **/
@Slf4j
public class EncriptUtil {
    private static final String KEY = "pio-tech";

    /**
     * 解密数据
     */
    public static String decrypt(String message) {
        try {
            byte[] bytesrc = convertHexString(message);
            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
            DESKeySpec desKeySpec = new DESKeySpec(KEY.getBytes("UTF-8"));
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
            IvParameterSpec iv = new IvParameterSpec(KEY.getBytes("UTF-8"));
            cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);
            byte[] retByte = cipher.doFinal(bytesrc);
            return new String(retByte);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 加密数据
     */
    public static byte[] encrypt(String message) {
        try {
            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
            DESKeySpec desKeySpec = new DESKeySpec(KEY.getBytes("UTF-8"));
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
            IvParameterSpec iv = new IvParameterSpec(KEY.getBytes("UTF-8"));
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
            return cipher.doFinal(message.getBytes("UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new byte[0];

    }

    public static byte[] convertHexString(String ss) {
        byte digest[] = new byte[ss.length() / 2];
        for (int i = 0; i < digest.length; i++) {
            String byteString = ss.substring(2 * i, 2 * i + 2);
            int byteValue = Integer.parseInt(byteString, 16);
            digest[i] = (byte) byteValue;
        }
        return digest;
    }

    public static String toHexString(byte b[]) {
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            String plainText = Integer.toHexString(0xff & b[i]);
            if (plainText.length() < 2) {
                plainText = "0" + plainText;
            }
            hexString.append(plainText);
        }
        return hexString.toString();
    }

    /**
     * 手机号加密
     *
     * @param phoneNumber
     * @return
     */
    public static String encryptionPhoneNumber(String phoneNumber) {
        log.info("手机号===" + phoneNumber);
        String passengerPhoneNum = null;
        try {
            String phoneNumbers = java.net.URLEncoder.encode(phoneNumber, "utf-8").toLowerCase();
            passengerPhoneNum = toHexString(EncriptUtil.encrypt(phoneNumbers)).toUpperCase();
            log.info("加密手机号===" + passengerPhoneNum);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return passengerPhoneNum;
    }

    /**
     * 手机号解密
     *
     * @param phoneNumber
     * @return
     */
    public static String decryptionPhoneNumber(String phoneNumber) {
        log.info("加密的手机号===" + phoneNumber);
        String phoneNumbers = null;
        try {
            phoneNumbers = java.net.URLDecoder.decode(decrypt(phoneNumber), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        log.info("解密后的手机号===" + phoneNumbers);
        return phoneNumbers;
    }

    public static void main(String[] args) {
        String phone = "3071D031690025BE062B04B2B5D59652";
        String newPhone = decryptionPhoneNumber(phone);
        System.out.println("==="+newPhone);
    }
}
