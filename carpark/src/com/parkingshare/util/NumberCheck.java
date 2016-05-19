package com.parkingshare.util;

public class NumberCheck {
	
	public static int nullToZero(String tmp) {//null이나 숫자로 바꿀 수 없는 값을 0으로 리턴
		int num = 0;
		if(isNumber(tmp)) {
			num = Integer.parseInt(tmp);
		}
		
		return num;
	}
	
	public static int nullToOne(String tmp) {//null이나 숫자로 바꿀 수 없는 값을 1로 리턴
		int num = 1;
		if(isNumber(tmp)) {
			num = Integer.parseInt(tmp);
		}
		
		return num;
	}

	private static boolean isNumber(String tmp) {
		boolean flag = true;
		if(tmp != null) {
			int len = tmp.length();
			for(int i=0; i<len; i++) {
				int x = tmp.charAt(i) - 48;
				if(x < 0 || x > 9) {
					flag = false;
					break;//하나라도 숫자가 아닌게 있다면 끝냄
				}
			}
		} else {
			flag = false;
		}
		
		return flag;
	}
	
}
