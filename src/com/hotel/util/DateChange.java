package com.hotel.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 日期转换处理函数
 * @author bfq
 *
 */
public class DateChange {
	/**
	 * 给日期添加天数，生成新的天数
	 * @param date
	 * @param day
	 * @return
	 */
	public static Date addDate(Date date,long day){
		 long time = date.getTime(); // 得到指定日期的毫秒数
		 day = day*24*60*60*1000; // 要加上的天数转换成毫秒数
		 time+=day; // 相加得到新的毫秒数
		 return new Date(time); // 将毫秒数转换成日期
	}
	
	/**
	* 通过时间秒毫秒数判断两个时间的间隔
	* @param date1
	* @param date2
	* @return
	*/
	public static int differentDaysByMillisecond(Date date1,Date date2)
	{
		int days = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
		return days;
	}
	/**
	 * 根据起始日期和天数，获取一个list日期集合
	 */
	public static List<Date> dateList(Date time,int day){
		List<Date> datelist = new ArrayList<>();
		datelist.add(time);
		for(int i=0;i<day;i++){
			datelist.add(addDate(time,i+1));
		}
		return datelist;
	}
}
