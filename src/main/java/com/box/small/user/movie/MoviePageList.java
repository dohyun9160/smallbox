package com.box.small.user.movie;

import java.util.List;

public class MoviePageList {
	PageDTO pageDTO;
	List<MovieDto> movieDtoList;
	public PageDTO getPageDTO() {
		return pageDTO;
	}
	public void setPageDTO(PageDTO pageDTO) {
		this.pageDTO = pageDTO;
	}
	public List<MovieDto> getMovieDtoList() {
		return movieDtoList;
	}
	public void setMovieDtoList(List<MovieDto> movieDtoList) {
		this.movieDtoList = movieDtoList;
	}
	public MoviePageList(PageDTO pageDTO, List<MovieDto> movieDtoList) {
		super();
		this.pageDTO = pageDTO;
		this.movieDtoList = movieDtoList;
	}
	@Override
	public String toString() {
		return "MoviePageList [pageDTO=" + pageDTO + ", movieDtoList=" + movieDtoList + "]";
	}
	public MoviePageList() {
	}
	
	
}
