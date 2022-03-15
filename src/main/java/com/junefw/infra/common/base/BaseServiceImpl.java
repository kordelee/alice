package com.junefw.infra.common.base;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.junefw.infra.common.constants.Constants;

public class BaseServiceImpl {

	public static Date nowDate () {
		LocalDateTime localDateTime = LocalDateTime.now();
		String dateTimeBasic = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		Instant instant = localDateTime.atZone(ZoneId.systemDefault()).toInstant();
		Date date = Date.from(instant);
		return date;
	}
	
	public static String nowString () {
		LocalDateTime localDateTime = LocalDateTime.now();
		String dateTimeBasic = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		return dateTimeBasic;
	}
	
}
