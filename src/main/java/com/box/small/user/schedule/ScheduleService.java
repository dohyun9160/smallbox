package com.box.small.user.schedule;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface ScheduleService {
	
	List<ScheduleDto> sellectAllSchedule() throws SQLException;	//	스케줄 전체 조회
	
	ScheduleDto sellectSchedule(int sch_no) throws SQLException;	//	스케줄 선택조회

	public ScheduleDto selectScreenSchedule(Map<String, Object> map);
	
	public List<ScheduleDto> selectScreen(int th_no); // 영화관으로 상영관 조회
}
