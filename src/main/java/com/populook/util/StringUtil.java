package com.populook.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.Security;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.GenericValidator;

public class StringUtil {

	/**
	 * 判断对象是否为null , 为null返回true,否则返回false
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isNull(Object obj) {
		return (null == obj) ? true : false;
	}

	/**
	 * 判断对象是否为null , 为null返回false,否则返回true
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isNotNull(Object obj) {
		return !isNull(obj);
	}

	/**
	 * 判断字符串是否为null或者0长度，字符串在判断长度时，先去除前后的空格,空或者0长度返回true,否则返回false
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNullOrZeroLenght(String str) {
		return GenericValidator.isBlankOrNull(str);
	}

	/**
	 * 判断字符串是否为null或者0长度，字符串在判断长度时，先去除前后的空格,空或者0长度返回false,否则返回true
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNotNullOrZeroLenght(String str) {
		return !isNullOrZeroLenght(str);
	}

	/**
	 * 判断数字类型是否为null或者0，如果是返回true，否则返回false
	 * 
	 * @param number
	 * @return
	 */
	public static boolean isNullOrZero(Number number) {
		if (isNotNull(number)) {
			return (number.intValue() != 0) ? false : true;
		}
		return true;
	}

	/**
	 * 判断数字类型是否不为null或者0，如果是返回true，否则返回false
	 * 
	 * @param number
	 * @return
	 */
	public static boolean isNotNullOrZero(Number number) {
		return !isNullOrZero(number);
	}

	/**
	 * 处理String类型字符串为一个String类型的数组
	 * 
	 * @param str
	 *            String字符串
	 * @return strArray String类型数组
	 */
	public static String[] toStringArray(String str) {
		String[] strArray = new String[str.length()];
		if (isNotNullOrZeroLenght(str)) {
			for (int i = 0; i < str.length(); i++) {
				strArray[i] = StringUtils.substring(str, i, i + 1);
			}
		}

		return strArray;
	}

	/**
	 * 获取本机主机名
	 * 
	 * @return 本机主机名
	 * @throws UnknownHostException
	 */
	public static String getHostName() throws UnknownHostException {
		InetAddress inetAddress = InetAddress.getLocalHost();
		return inetAddress.getHostName();
	}

	/**
	 * 分割字符串
	 * 
	 * @param str
	 * @param regexs
	 * @return
	 */
	public static String[] split(String str, String[] regexs) {
		if (isNull(regexs)) {
			return null;
		}
		String[] results = new String[regexs.length + 1];
		int posix = 0;
		int count = 0;
		for (String regex : regexs) {
			posix = StringUtils.indexOf(str, regex);
			results[count] = StringUtils.substring(str, 0, posix);
			str = StringUtils.substring(str, posix + 1);
			count++;
		}
		results[count] = str;
		return results;
	}

	/**
	 * 特殊字符定义
	 * 
	 * @return List<String>
	 */
	public static List<String> getSpecialChars() {
		List<String> specialChars = new ArrayList<String>();
		specialChars.add("$");
		specialChars.add("^");
		specialChars.add("?");
		return specialChars;
	}

	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "本地";
		}
		return ip;
	}

	public static String getMD5(String str) {
		return getMD5(str, null, 2);
	}

	public static String getMD5(String str, String encoding, int no_Lower_Upper) {
		if (null == encoding)
			encoding = "utf-8";
		StringBuffer sb = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] array = md.digest(str.getBytes(encoding));
			for (int i = 0; i < array.length; i++) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).toUpperCase().substring(1, 3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (no_Lower_Upper == 0) {
			return sb.toString();
		}
		if (no_Lower_Upper == 1) {
			return sb.toString().toLowerCase();
		}
		if (no_Lower_Upper == 2) {
			return sb.toString().toUpperCase();
		}
		return null;
	}

	private static Key getKey(byte[] arrBTmp) throws Exception {
		byte[] arrB = new byte[8];// 创建一个空的8位字节数组（默认值为0）
		for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) { // 将原始字节数组转换为8位
			arrB[i] = arrBTmp[i];
		}
		Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");// 生成密钥
		return key;
	}

	private static byte[] hexStr2ByteArr(String strIn) throws Exception {
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

	private static String byteArr2HexStr(byte[] arrB) throws Exception {
		int iLen = arrB.length;
		// 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
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
			sb.append(Integer.toString(intTmp, 16));
		}
		return sb.toString();
	}

	public static String getDES(String deskey, String str, int type) {
		Cipher encryptCipher = null;
		Cipher decryptCipher = null;
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		try {
			Key key = getKey(deskey.getBytes());
			encryptCipher = Cipher.getInstance("DES");
			encryptCipher.init(Cipher.ENCRYPT_MODE, key);
			decryptCipher = Cipher.getInstance("DES");
			decryptCipher.init(Cipher.DECRYPT_MODE, key);
			if (type == 0) { // 0为加密
				return byteArr2HexStr(encryptCipher.doFinal(str.getBytes()));
			} else {
				return new String(decryptCipher.doFinal(hexStr2ByteArr(str)));
			}
		} catch (Exception e) {
			return null;
		}
	}

	public static int getRandom(int min, int max) {
		return (int) (Math.random() * (max - min) + min);
	}

	public static int getRandom(int number) {
		int max = 9;
		int min = 1;
		for (int i = 1; i < number; i++) {
			min = min * 10;
			max = max * 10 + 9;
		}
		return getRandom(min, max);
	}
	
	public static String getDate(String formatStr) {
		return getDate(1, formatStr);
	}
	
	public static String getDate(int type) {
		return getDate(2, null);
	}

	public static String getDate(int type, String formatStr) {
		Date date = new Date();
		SimpleDateFormat sdf = null;
		if (null != formatStr) {
			sdf = new SimpleDateFormat(formatStr);
		} else if (type == 0) {
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		} else if (type == 1) {
			sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		} else if (type == 2) {
			sdf = new SimpleDateFormat("yyyyMMdd");
		}
		String str = sdf.format(date);
		return str;
	}
	
	   public static int compare_date(String DATE1, String DATE2,int type) {
	        DateFormat df =null;
	        if (type == 0) {
	        	df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			} else if (type == 1) {
				df = new SimpleDateFormat("yyyy-MM-dd");
			}
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	            if (dt1.getTime() > dt2.getTime()) {
	                return 1;
	            } else if (dt1.getTime() < dt2.getTime()) {
	                return -1;
	            } else {
	                return 0;
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return 0;
	  }


	public static long getDateCompare(String current_time, String compare_time) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long time = 0;
		try {
			Date c_tiem = sf.parse(current_time);
			Date com_time = sf.parse(compare_time);
			long l = c_tiem.getTime() - com_time.getTime() > 0 ? c_tiem.getTime() - com_time.getTime() : com_time.getTime() - c_tiem.getTime();
			time = l / 1000; // 算出超时秒数
		} catch (Exception e) {
			e.printStackTrace();
		}
		return time;
	}

	public static long getDateAdd(String startTime, String endTime, int type) {
		long time = 0l;
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startTime);
			Date addLong = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endTime);
			switch (type) {
			case 0:
				time = (date.getTime() / 1000) + (addLong.getTime() / 1000);
				break;
			case 1:
				time = (date.getTime() / 1000) - (addLong.getTime() / 1000);
				break;
			default:
				time = (date.getTime() / 1000) + (addLong.getTime() / 1000);
				break;
			}
			date.setTime(time * 1000);
			time = date.getTime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return time;
	}

	public static Object[] getMaxMonth(String time) {
		Object[] obj = new Object[2];
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar a = Calendar.getInstance();
		a.setTime(date);
		a.set(Calendar.DATE, 1); // 把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxMonth = a.get(Calendar.DATE);
		a.roll(Calendar.DATE, 1);
		time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(a.getTime());
		obj[0] = maxMonth;
		obj[1] = time;
		return obj;
	}

	public static String getUid() {
		return new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + getRandom(4);
	}

	public static Long getUid(int number) {
		return Long.parseLong(new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + getRandom(number));
	}
	
	public static Date strToDate(String type,String strDate) {
		SimpleDateFormat sdf=null;
		Date date=null;
		try {
			sdf = new SimpleDateFormat(type);
			date = sdf.parse(strDate);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}

/*	public static void toJsonMsg(HttpServletResponse response, int type, String msg) {
		Message message = new Message();
		if (type == 0) {
			message.setSuccess(true);
			if (msg == null) {
				message.setMessage("成功");
			} else {
				message.setMessage(msg);
			}
		} else {
			message.setSuccess(false);
			if (msg == null) {
				message.setMessage("失败");
			} else {
				message.setMessage(msg);
			}
		}
		toJsonPrint(response, JSONUtil.beanToJson(message));
	}*/

	public static void toJsonPrint(HttpServletResponse response, String str) {
		writer(response, str);
	}

	public static void writer(HttpServletResponse response, String str) {
		try {
			// 设置页面不缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(str);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void toSript(HttpServletResponse httpServletResponse, String str) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script type=\"text/javascript\">");
		sb.append(str);
		sb.append("</script>");
		httpServletResponse.setContentType("text/html");
		writer(httpServletResponse, sb.toString());
	}

	/**
	 * Java文件操作 获取文件扩展名
	 * @param filename
	 * @return
	 */
	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}

	/**
	 * Java文件操作 获取不带扩展名的文件名
	 * @param filename
	 * @return
	 */
	public static String getFileNameNoEx(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length()))) {
				return filename.substring(0, dot);
			}
		}
		return filename;
	}
	
	public static String createFileName(String path, String extName) {
		String fileName = getDate(2) + "/" + getUid() + "." + extName;
		File file = new File(path, fileName);
		if (file.exists()) {
			createFileName(path, extName);
		}
		return fileName;
	}

}
