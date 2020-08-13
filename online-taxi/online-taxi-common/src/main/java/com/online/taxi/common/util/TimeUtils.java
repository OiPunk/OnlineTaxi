package com.online.taxi.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 功能描述
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
