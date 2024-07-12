package com.box.small.dao.user.movie;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.box.small.dto.Movie;

public interface movieDAO {
    
	List<Movie> sellectAllMovie() throws SQLException;	//	movie ���̺��� ��� ������ �������� �޼ҵ�
	
	Movie sellectMovie(int mo_id) throws SQLException;	//	movie ���̺��� mo_id �� ���� Ư�� ��ȭ�� ������ ��������� �޼ҵ�
	
	void sellectAlltheater() throws SQLException;	//	theater���̺��� ��� ������ �������� �޼ҵ�
	
	void sellectTheater(int th_id) throws SQLException;	//	theater���̺��� th_id�� ���ؼ� Ư�� ������ ������ �������� �޼ҵ�
	
	void addMovie(Movie movie) throws SQLException;	//	Movie���̺� ��ȭ�� �߰��ϴ� �޼ҵ�
	
	void deleteMovie(int mo_id) throws SQLException;	//	mo_id�� �̿��ؼ� movie�� status�� 0���� �ٲٴ� �޼ҵ�
	
	void updateMovie(int mo_id, Movie movie) throws SQLException;	//	mo_id�� �̿��ؼ� movie�� ������ �����ϴ� �޼ҵ�
	
}
