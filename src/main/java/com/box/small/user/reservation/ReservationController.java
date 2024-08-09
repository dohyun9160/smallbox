package com.box.small.user.reservation;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.box.small.user.movie.MovieDto;
import com.box.small.user.movie.MovieService;
import com.box.small.user.payment.PaymentService;
import com.box.small.user.schedule.ScheduleDto;
import com.box.small.user.schedule.ScheduleService;
import com.box.small.user.schedule.ScreenDto;
import com.box.small.user.theater.TheaterDto;
import com.box.small.user.theater.TheaterService;
import com.box.small.user.theaterseat.TheaterseatDto;
import com.box.small.user.theaterseat.TheaterseatService;

@Controller
public class ReservationController {
	
	@Autowired
	private MovieService movieService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private TheaterseatService theartseatService;
	@Autowired
	private ScheduleService scheduleService;
	
	//test용
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private PaymentService payService;
	
	
	@GetMapping(value="/user/reservation/reservation")
	public ModelAndView  reservateion() throws SQLException {
		List<MovieDto> movieServiceList =  movieService.selectAllMovie();
		List<TheaterDto> theaterList =  theaterService.selectAllTheater();
		ModelAndView mav = new ModelAndView();	
		mav.addObject("movieServiceList", movieServiceList);
		mav.addObject("theaterList", theaterList);
		mav.setViewName("user/reservation/reservation");
		return mav;
	}
	
	@PostMapping(value="/user/reservation/reservation")
	public ModelAndView  reservateion1(HttpServletRequest request) throws SQLException {	
		List<MovieDto> movieServiceList =  movieService.selectAllMovie();
		List<TheaterDto> theaterList =  theaterService.selectAllTheater();
        
        // 필요한 값 추출
        String mo_no = request.getParameter("mo_no");
        System.out.println(mo_no);
        int th_no = Integer.parseInt(request.getParameter("th_no"));
        System.out.println(th_no);
        String sch_date = request.getParameter("sch_date");
        System.out.println(sch_date);
        // Map에 저장
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("mo_no", mo_no);
        params.put("th_no", th_no);
        params.put("sch_date", sch_date);	     
	    List<ScreenDto> screenList = scheduleService.selectScreenTh_no(th_no);
	    System.out.println("스크린리스트:"+screenList);
	    params.put("screenList", screenList);   
	    List<ScheduleDto> schduleList = scheduleService.selectScreenSchedule(params);
	    System.out.println("상영시간"+schduleList);
        ModelAndView mav = new ModelAndView();		
		mav.addObject("movieServiceList", movieServiceList);
		mav.addObject("theaterList", theaterList);
		mav.addObject("schduleList", schduleList);
		mav.addObject("params", params);
		mav.setViewName("user/reservation/reservation");
		
		return mav;
	}
	
	
	@PostMapping(value="/user/reservation/reservation2")
	public ModelAndView  reservateion2(HttpServletRequest request) throws SQLException {
		// 필요한 값 추출
		String sch_startTime = request.getParameter("selectedSchedule");
		String sc_no = request.getParameter("sc_no");
        // Map에 저장
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("sch_startTime", sch_startTime);
        params.put("sc_no", sc_no);
        
        List<TheaterseatDto> theaterSeatList = theartseatService.theaterseatList(params);
        params.put("theaterSeatList", theaterSeatList);
        
        // 좌석알파벳 리스트 생성
        List<String> alphabetList = Arrays.asList("a", "b", "c");
		
		ModelAndView mav = new ModelAndView();		
		mav.addObject("params", params);
		mav.addObject("alphabetList", alphabetList);
		mav.setViewName("user/reservation/reservation2");
		return mav;
	}	
	
	// test
	@GetMapping(value="/test")
	public ModelAndView  test() throws SQLException {
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("test");
		return mav;
	}	
	
	//test
	@ResponseBody
	@PostMapping(value="/test", consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<ReservationDataListDto> cancelReservation(@RequestBody Map<String, Object> params) throws SQLException {
		reservationService.cancelReservation(params);
		ReservationDto reservationDto =  reservationService.selectReservation(params);
		payService.canclePayment(params);	
		int ts_no = reservationDto.getTs_no();
		params.put("ts_no", ts_no);
		theartseatService.cancelSeat(params);
		
		String mem_id = "test"; 
		List<ReservationDto> reservationList = reservationService.reservationList(mem_id);
		List<MovieDto> movieList = movieService.selectAllMovie();
		List<ScheduleDto> schedeuleList = scheduleService.selectAllSchedule();
		List<TheaterDto> theaterList = theaterService.selectAllTheater();
		List<TheaterseatDto> theaterseatList = theartseatService.seatListAll();
		List<ReservationDataListDto> dataList = new ArrayList<>();
		List<ScreenDto> screenList = scheduleService.selectAllScreen();
		dataList.add(new ReservationDataListDto(reservationList,movieList,schedeuleList,theaterList,screenList,theaterseatList));
		return dataList;
	}
	
}
