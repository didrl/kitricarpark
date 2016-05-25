package com.carpark.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

public interface MemberReservationDao {
//carinfo : get Cars Info of Member		(carNum or carSize or kind of car . . .)
//availabledate : get Dates can reservation	(have to change data only available date to available date with available time)
	
	ArrayList<Map<String,String>> getCarInfo(String user_id);
	ArrayList<String> getUsingDate(int park_id);
}
