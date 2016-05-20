package com.carpark.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Encoder {
	public static String isoToUtf(String tmp) {
		String utf = "";
		try {
			if(tmp != null)
				utf = new String(tmp.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return utf;
	}
	
	public static String eucUrl(String tmp) {
		String utf = "";
		try {
			if(tmp != null)
				utf = URLEncoder.encode(tmp, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return utf;
	}
	
}
