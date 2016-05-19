package com.parkingshare.util;

public class NumberCheck {
	
	public static int nullToZero(String tmp) {//null�̳� ���ڷ� �ٲ� �� ���� ���� 0���� ����
		int num = 0;
		if(isNumber(tmp)) {
			num = Integer.parseInt(tmp);
		}
		
		return num;
	}
	
	public static int nullToOne(String tmp) {//null�̳� ���ڷ� �ٲ� �� ���� ���� 1�� ����
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
					break;//�ϳ��� ���ڰ� �ƴѰ� �ִٸ� ����
				}
			}
		} else {
			flag = false;
		}
		
		return flag;
	}
	
}
