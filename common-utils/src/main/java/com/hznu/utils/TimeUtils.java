package com.hznu.utils;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 * TimeUtils
 *
 * @author xuzou
 * @date 6/16/16
 * @copyright: copyright @ hznuTech 2016
 */
public class TimeUtils {

    private static final String FORMATE_DATE = "yyyy-MM-dd";

    public static String  afterPeriod(String start,String  periodStr){
        DateTimeFormatter format = DateTimeFormat.forPattern(FORMATE_DATE);
        DateTime startTime = DateTime.parse(start,format);

        PeriodEnum period = PeriodEnum.valueOf(periodStr);
        return afterPeriod(startTime,period).toString(FORMATE_DATE);
    }

    public static DateTime afterPeriod(DateTime start,PeriodEnum period){
        DateTime endTime = DateTime.now();
        switch (period){
            case DAY : endTime=start.plusDays(1);break;
            case WEEK: endTime=start.plusWeeks(1);break;
            case MONTH: endTime=start.plusMonths(1);break;
            case SEESION:endTime=start.plusMonths(4);break;
            case YEAR:endTime=start.plusYears(4);
        }
        return endTime;
    }

    public static String thisPeriod(String start,String  periodStr){
        DateTimeFormatter format = DateTimeFormat.forPattern(FORMATE_DATE);
        DateTime startTime = DateTime.parse(start,format);

        PeriodEnum period = PeriodEnum.valueOf(periodStr);
        return thisPeriod(startTime,period).toString(FORMATE_DATE);
    }

    /**
     *
     * @param start
     * @param period
     * @return
     */
    public static DateTime thisPeriod(DateTime start, PeriodEnum period){
        DateTime endTime = DateTime.now();
        switch (period){
            case DAY : endTime=start.plusDays(1);break;
            case WEEK: endTime=start.dayOfWeek().withMaximumValue();break;
            case MONTH: endTime=start.dayOfMonth().withMaximumValue();break;
            case YEAR:endTime=start.dayOfYear().withMaximumValue();
        }
        return endTime;
    }

}
