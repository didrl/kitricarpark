package com.carpark.util;

public class StringCheck {

	public static String nullToBlank(String tmp) {
		return tmp == null ? "" : tmp;//tmp가 null이면 비어있는 문자열을 리턴
	}
	
}
 