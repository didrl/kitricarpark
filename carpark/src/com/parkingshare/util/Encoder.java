package com.parkingshare.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Encoder {
	public static String isoToEuc(String tmp) {
		String euc = "";
		try {
			if(tmp != null)
				euc = new String(tmp.getBytes("iso-8859-1"), "euc-kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return euc;
	}
	
	public static String eucUrl(String tmp) {
		String euc = "";
		try {
			if(tmp != null)
				euc = URLEncoder.encode(tmp, "euc-kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return euc;
	}
	
}
