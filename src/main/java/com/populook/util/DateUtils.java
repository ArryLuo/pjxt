package com.populook.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
	
	/**
	 * 格式化字符串日期
	 * */
	public static String formatStringDate(String date){
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=sf.format(date);
		return time;
	}
	
	
	
	public static String getBeforeDate(Date date,int days,SimpleDateFormat df)
	{
		Calendar calendar = Calendar.getInstance();   
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_YEAR,calendar.get(Calendar.DAY_OF_YEAR) - days);
		return df.format(calendar.getTime());
	}
	
	public static String getAfterDate(Date date,int days,SimpleDateFormat df)
	{
		Calendar calendar = Calendar.getInstance();   
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_YEAR,calendar.get(Calendar.DAY_OF_YEAR) + days);
		return df.format(calendar.getTime());
	}
	
	public static String getAfterHour(Date date,int hour,SimpleDateFormat df)
	{
		Calendar calendar = Calendar.getInstance();   
		calendar.setTime(date);
		calendar.add(Calendar.HOUR_OF_DAY,hour);
		return df.format(calendar.getTime());
	}
	
	public static Date parseDate(String date,String format){
		SimpleDateFormat sf=new SimpleDateFormat(format);
		try {
			return sf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String formatDate(Date date,String format){
		SimpleDateFormat sf=new SimpleDateFormat(format);
		return sf.format(date);
	}

	public static String now(){
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sf.format(new Date());
	}

}
