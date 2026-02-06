package com.rydr.taxi.common.util;
import org.apache.commons.codec.binary.Base64;
import javax.crypto.Cipher;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

public class RSAEncrypt {
	
	// Used to store randomly generated public and private keys
	private static Map<Integer, String> keyMap = new HashMap<Integer, String>();  
	
	static {
		String publicKeyString = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDefDQOvm1MdubDmaYUzee1+uukQx2qjSv/KIYDUF4Lg0R8OzcaLUcOdWvjkhBUa0p1Uf9WBir81erZZnPM9TxnQjcl9xmEuzmu63Ykdf2Y+kUU8fibVmnlXxrm+7lEF+bCL3CIaTACa0i602zkJTdQvhPKrBNtNa/zoh/6OKfaCwIDAQAB";
		String privateKeyString = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAN58NA6+bUx25sOZphTN57X666RDHaqNK/8ohgNQXguDRHw7NxotRw51a+OSEFRrSnVR/1YGKvzV6tlmc8z1PGdCNyX3GYS7Oa7rdiR1/Zj6RRTx+JtWaeVfGub7uUQX5sIvcIhpMAJrSLrTbOQlN1C+E8qsE201r/OiH/o4p9oLAgMBAAECgYEAvDRXGS3PacKfXVGJo8m2vEOhuJep7c90K2mNTBpdI+IMOgchirxIgpukA6NYuwDzwKD3nT6keLNA8lzvkq7VQ3RJv7yQTjuc6foVZjI05M/QCz0qa3Ss2rwASkKu+FQFrN1eSrPIktkVVVeKUepdqE43ZVnFxB2hsFRFV85mIHkCQQD2xCgUebWV3OHViA9wCKpTcRpODt1KyTEHIFBQDrUVDV4EhuYYXQwOakbItBoLMtl2nue9uD1s11adwkqK90C3AkEA5s9zm221S+fZz+DBEibThiwjxOFbv431mfvmFe/IR5x08FmzTJorzgsEQen79KTTbid5ELArzWGxt+TZqLi1TQJAKsgDMtmO87ZhqMV397Jo5SJ8rv/AudB7oYKmqdqC5m102VAR4DNxfaZLM0yWH07niLsv7iJc89u5doxSpBkNrQJAe60bqGRf6h2BNAedzQkq/NE4FW4gSINb4Df/MS/8JIssigG2tsxBvrVegadMT+nmNTdHgu6zeejoXr5s9yCKXQJAVZ/I9pdYfobPs4HFbJBHMW0uzxyx1YAi4F46J9zKE027gs1mq5I4lRfxi9IfJtduM6OtWNqKdC1cLqt9aSqvsw==";
		
		// Save public and private keys to Map
		// 0 represents public key, 1 represents private key
		keyMap.put(0,publicKeyString);
		keyMap.put(1,privateKeyString);
	}



	/**
	 * Randomly generate key pair
	 * @throws NoSuchAlgorithmException
	 */
	public static void genKeyPair() throws NoSuchAlgorithmException {
		// KeyPairGenerator class is used to generate public and private key pairs, based on RSA algorithm
		KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");
		// Initialize key pair generator, key size is 96-1024 bits
		keyPairGen.initialize(1024,new SecureRandom());
		// Generate a key pair, saved in keyPair
		KeyPair keyPair = keyPairGen.generateKeyPair();
		// Get private key
		RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
		// Get public key
		RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
		String publicKeyString = new String(Base64.encodeBase64(publicKey.getEncoded()));
		// Get private key string
		String privateKeyString = new String(Base64.encodeBase64((privateKey.getEncoded())));
		// Save public and private keys to Map
		// 0 represents public key, 1 represents private key
		keyMap.put(0,publicKeyString);
		keyMap.put(1,privateKeyString);
	}
	/**
	 * RSA public key encryption
	 *
	 * @param str
	 *            string to encrypt
	 * @param publicKey
	 *            public key
	 * @return ciphertext
	 * @throws Exception
	 *             exception during encryption
	 */
	public static String encrypt( String str, String publicKey ) throws Exception{
		// Base64 encoded public key
		byte[] decoded = Base64.decodeBase64(publicKey);
		RSAPublicKey pubKey = (RSAPublicKey) KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(decoded));
		// RSA encryption
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, pubKey);
		String outStr = Base64.encodeBase64String(cipher.doFinal(str.getBytes("UTF-8")));
		return outStr;
	}

	/**
	 * RSA private key decryption
	 *
	 * @param str
	 *            encrypted string
	 * @param privateKey
	 *            private key
	 * @return plaintext
	 * @throws Exception
	 *             exception during decryption
	 */
	public static String decrypt(String str, String privateKey) throws Exception{
		// Base64 decode the encrypted string
		byte[] inputByte = Base64.decodeBase64(str.getBytes("UTF-8"));
		// Base64 encoded private key
		byte[] decoded = Base64.decodeBase64(privateKey);
        RSAPrivateKey priKey = (RSAPrivateKey) KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(decoded));
		// RSA decryption
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, priKey);
		String outStr = new String(cipher.doFinal(inputByte));
		return outStr;
	}

	public static void main(String[] args) throws Exception {
		// Generate public and private keys
//		genKeyPair();
		// String to encrypt
		String message = "Beijing Mashibing";
		System.out.println("Randomly generated public key: " + keyMap.get(0));
		System.out.println("Randomly generated private key: " + keyMap.get(1));
		String messageEn = encrypt(message,keyMap.get(0));
		System.out.println(message + "\tEncrypted string: " + messageEn);
		String messageDe = decrypt(messageEn,keyMap.get(1));
		System.out.println("Restored string: " + messageDe);
	}

}