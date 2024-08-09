package com.box.small;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.box.small.admin.admin.AdminService;
import com.box.small.user.member.MemberDto;
import com.box.small.user.movie.CategoryDto;
import com.box.small.user.movie.MovieDto;
import com.box.small.user.movie.MovieService;
import com.box.small.user.support.SupportDto;
import com.box.small.user.support.SupportService;

/**
 * Handles requests for the application home page.
 */


@Controller
public class HomeController {

    
    @Autowired
    private MovieService service;

    @Autowired
    private SupportService supportService;
    
	@Autowired
	private AdminService adminService;

    
    @RequestMapping(value = "/", method = RequestMethod.GET)
   public ModelAndView selectAllmovie() throws SQLException {
      
      System.out.println("메인 페이지로 이동");
      
      ModelAndView mav = new ModelAndView();
      
      List<MovieDto>movieList = service.selectAllMovieLive(0);
      List<SupportDto> noticeTop4List = supportService.noticeTop4List();
      
      List<CategoryDto>category = service.allCategory();
      mav.addObject("movieList", movieList);
      mav.addObject("category",category);
      mav.addObject("noticeTop4List", noticeTop4List);
      mav.setViewName("home_beta");
      return mav;
   }
    
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView adminhome() {
		ModelAndView mav = new ModelAndView();
		List<MemberDto> memberList = adminService.selectAllMember();
		for(MemberDto m : memberList){
			System.out.println(m);
		}
		mav.addObject("memberList",memberList);
		mav.setViewName("homeAdmin_beta");
        return mav;
    }


}
