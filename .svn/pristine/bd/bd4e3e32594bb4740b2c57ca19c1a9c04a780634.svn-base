package com.populook.util;

import java.util.Random;

public class RandomCode {
	public static final String allChar = "0123456789"; 
	public static final String allChar2 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
	public static final String allChar3 = "0123456789abcdefghijklmnopqrstuvwxyz"; 
	public static String generateCode(int length){
		StringBuffer sf=new StringBuffer();
		Random rand=new Random();

		for (int i = 0; i < length; i++) {
		sf.append(allChar.charAt(rand.nextInt(allChar.length()))); 
		}
		return sf.toString();
	}
	public static String generateCode2(int length){
		StringBuffer sf=new StringBuffer();
		Random rand=new Random();

		for (int i = 0; i < length; i++) {
		sf.append(allChar2.charAt(rand.nextInt(allChar2.length()))); 
		}
		return sf.toString();
	}
	/** caiwenhong add
	 * @param length 要随机生成的长度
	 * @return  随机数（小写+数字）
	 */
	public static String generateCode3(int length){
		StringBuffer sf=new StringBuffer();
		Random rand=new Random();

		for (int i = 0; i < length; i++) {
		sf.append(allChar3.charAt(rand.nextInt(allChar3.length()))); 
		}
		return sf.toString();
	}
	public static void main(String[] args) {
		System.out.println(RandomCode.generateCode3(8));
	}
	
}
