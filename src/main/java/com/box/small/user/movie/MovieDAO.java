package com.box.small.user.movie;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface MovieDAO {
    
	List<MovieDto> selectAllMovie() throws SQLException;	//	영화 전체조회
	
	List<MovieDto> selectAllMovieLive(int cat_no) throws SQLException;	//	상영중인영화 전체조회
	
	MovieDto selectMovie(int mo_no) throws SQLException;	//	영화 선택 조회
	
	String category(int cat_no);
	
	List<CategoryDto> allCategory();
	
	List<MovieDto> selectMovieCategory(int cat_no);

	boolean checkMovieLike(MovieLikeDto ml);

	int insertMovieLike(MovieLikeDto ml);

	int updateMovieLike(MovieLikeDto ml);

	MovieLikeDto MovieLikeStatus(MovieLikeDto ml);
	
	List<MovieDto> moviePage(Map<String, Object> params);
}
