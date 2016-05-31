package com.carpark.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.ReservationDto;

public interface MemberReservationDao {
//carinfo : get Cars Info of Member		(carNum or carSize or kind of car . . .)
//availabledate : get Dates can reservation	(have to change data only available date to available date with available time)
	
	ArrayList<MemberCarDto> getCarInfo(String user_id);
	ArrayList<Map<String,String>> getUsingDate(int park_id);
	void registerReservation(ReservationDto reservationDto);
	ArrayList<ReservationDto> myReservationList(String user_id);
}
