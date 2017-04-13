package com.populook.util;

import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.security.Key;
import java.security.Security;
import java.util.Iterator;
import java.util.regex.Pattern;
import javax.crypto.Cipher;

public class DESPlus {
	private static String strDefaultKey = "11";

	private Cipher encryptCipher = null;

	private Cipher decryptCipher = null;

	/**
	 * 将byte数组转换为表示16进制值的字符串， 如：byte[]{8,18}转换为：0813， 和public static byte[]
	 * hexStr2ByteArr(String strIn) 互为可逆的转换过程
	 * 
	 * @param arrB
	 *            需要转换的byte数组
	 * @return 转换后的字符串
	 * @throws Exception
	 *             本方法不处理任何异常，所有异常全部抛出
	 */
	public String byteArr2HexStr(byte[] arrB) throws Exception {
		int iLen = arrB.length;
		// 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍..一个byte转成16进制最多不会超过两位。FF
		StringBuffer sb = new StringBuffer(iLen * 2);
		for (int i = 0; i < iLen; i++) {
			int intTmp = arrB[i];
			// 把负数转换为正数
			while (intTmp < 0) {
				intTmp = intTmp + 256;
			}
			// 小于0F的数需要在前面补0
			if (intTmp < 16) {
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp, 16)); // 16代表进制
		}
		return sb.toString();
	}

	/**
	 * 将表示16进制值的字符串转换为byte数组， 和public static String byteArr2HexStr(byte[] arrB)
	 * 互为可逆的转换过程
	 * 
	 * @param strIn
	 *            需要转换的字符串
	 * @return 转换后的byte数组
	 * @throws Exception
	 *             本方法不处理任何异常，所有异常全部抛出
	 * @author <a href="mailto:leo841001@163.com">LiGuoQing</a>
	 */
	public byte[] hexStr2ByteArr(String strIn) throws Exception {
		byte[] arrB = strIn.getBytes();
		int iLen = arrB.length;

		// 两个字符表示一个字节，所以字节数组长度是字符串长度除以2
		byte[] arrOut = new byte[iLen / 2];
		for (int i = 0; i < iLen; i = i + 2) {
			String strTmp = new String(arrB, i, 2);
			arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
		}
		return arrOut;
	}

	/**
	 * 默认构造方法，使用默认密钥
	 * 
	 * @throws Exception
	 */
	public DESPlus() throws Exception {
		this(strDefaultKey);
	}

	/**
	 * 指定密钥构造方法
	 * 
	 * @param strKey
	 *            指定的密钥
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	public DESPlus(String strKey) throws Exception {
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		Key key = getKey(strKey.getBytes());

		encryptCipher = Cipher.getInstance("DES");
		encryptCipher.init(Cipher.ENCRYPT_MODE, key);

		decryptCipher = Cipher.getInstance("DES");
		decryptCipher.init(Cipher.DECRYPT_MODE, key);
	}

	/**
	 * 加密字节数组
	 * 
	 * @param arrB
	 *            需加密的字节数组
	 * @return 加密后的字节数组
	 * @throws Exception
	 */
	public byte[] encrypt(byte[] arrB) throws Exception {
		return encryptCipher.doFinal(arrB);
	}

	/**
	 * 加密字符串
	 * 
	 * @param strIn
	 *            需加密的字符串
	 * @return 加密后的字符串
	 * @throws Exception
	 */
	public String encrypt(String strIn) {
		try {
			if (isNull(strIn)) {
				return strIn;
			}
			return byteArr2HexStr(encrypt(strIn.getBytes()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strIn;

	}

	/**
	 * 解密字节数组
	 * 
	 * @param arrB
	 *            需解密的字节数组
	 * @return 解密后的字节数组
	 * @throws Exception
	 */
	public byte[] decrypt(byte[] arrB) throws Exception {
		return decryptCipher.doFinal(arrB);
	}

	/**
	 * 解密字符串
	 * 
	 * @param strIn
	 *            需解密的字符串
	 * @return 解密后的字符串
	 * @throws Exception
	 */
	public String decrypt(String strIn) throws Exception {
		if (isNull(strIn)) {
			return strIn;
		}
		return new String(decrypt(hexStr2ByteArr(strIn)));
	}

	/**
	 * 从指定字符串生成密钥，密钥所需的字节数组长度为8位 不足8位时后面补0，超出8位只取前8位
	 * 
	 * @param arrBTmp
	 *            构成该字符串的字节数组
	 * @return 生成的密钥
	 * @throws java.lang.Exception
	 */
	private Key getKey(byte[] arrBTmp) throws Exception {
		// 创建一个空的8位字节数组（默认值为0）
		byte[] arrB = new byte[8];

		// 将原始字节数组转换为8位
		for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
			arrB[i] = arrBTmp[i];
		}

		// 生成密钥
		Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");

		return key;
	}

	/**
	 * 空值检查<br>
	 * <br>
	 * 
	 * @param pInput
	 *            要检查的字符串<br>
	 * @return boolean 返回检查结果,但传入的字符串为空的场合,返回真<br>
	 */
	public static boolean isNull(Object pInput) {
		// 判断参数是否为空或者''
		if (pInput == null || "".equals(pInput)) {
			return true;
		} else if ("java.lang.String".equals(pInput.getClass().getName())) {
			// 判断传入的参数的String类型的

			// 替换各种空格
			String tmpInput = Pattern.compile("//r|//n|//u3000").matcher((String) pInput).replaceAll("");
			// 匹配空
			return Pattern.compile("^(//s)*$").matcher(tmpInput).matches();
		} else {
			// 方法类
			Method method = null;
			String newInput = "";
			try {
				// 访问传入参数的size方法
				method = pInput.getClass().getMethod("size");
				// 判断size大小

				// 转换为String类型
				newInput = String.valueOf(method.invoke(pInput));
				// size为0的场合
				if (Integer.parseInt(newInput) == 0) {

					return true;
				} else {

					return false;
				}
			} catch (Exception e) {
				// 访问失败
				try {
					// 访问传入参数的getItemCount方法
					method = pInput.getClass().getMethod("getItemCount");
					// 判断size大小

					// 转换为String类型
					newInput = String.valueOf(method.invoke(pInput));

					// getItemCount为0的场合
					if (Integer.parseInt(newInput) == 0) {

						return true;
					} else {

						return false;
					}
				} catch (Exception ex) {
					// 访问失败
					try {
						// 判断传入参数的长度

						// 长度为0的场合
						if (Array.getLength(pInput) == 0) {

							return true;
						} else {

							return false;
						}
					} catch (Exception exx) {
						// 访问失败
						try {
							// 访问传入参数的hasNext方法
							method = Iterator.class.getMethod("hasNext");
							// 转换String类型
							newInput = String.valueOf(method.invoke(pInput));

							// 转换hasNext的值
							if (!Boolean.valueOf(newInput)) {
								return true;
							} else {
								return false;
							}

						} catch (Exception exxx) {
							// 以上场合不满足

							return false;
						}
					}
				}
			}
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			String test = "123456";
			 DESPlus des = new DESPlus("leemenz");// 自定义密钥
			System.out.println("加密前的字符：" + test);
			System.out.println("加密后的字符：" + des.encrypt(test));
			System.out.println("解密后的字符：" + des.decrypt(des.encrypt(test)));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
