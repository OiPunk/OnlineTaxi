package com.rydr.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Time Utility
 *
 * @date 2018/8/14
 */

public class TimeUtils {

    public static String getDefaultFormate(Date date){
        String dateFormate = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat formater = new SimpleDateFormat(dateFormate);
        if(null == date){
            return "";
        }
        return formater.format(date);
    }

    public Date getDisDate(Integer calendarField, Integer number){
        Calendar calendar = Calendar.getInstance();
        calendar.add(calendarField, number);
        return calendar.getTime();
    }

}
