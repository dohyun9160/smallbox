package com.box.small.user.schedule;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ScheduleDAO {

List<ScheduleDto> selectAllSchedule() throws SQLException;	//	스케줄 전체 조회
	
	ScheduleDto selectSchedule(int sch_no) throws SQLException;	//	스케줄 선택조회

	List<ScheduleDto> selectScreenSchedule(Map<String, Object> map);	// 영화,극장,날짜 선택 후 조회
	
	ScreenDto selectScreen(int sc_no); // 상영관 선택조회
	
	List<ScreenDto> selectAllScreen();//상영관 전체조회
	
	List<ScreenDto> selectScreenTh_no(int th_no);//영화관 번호로 상영관 조회
	
	//
}
