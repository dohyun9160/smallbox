package com.box.small.user.reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Autowired
	private SqlSession sqlSession;
	
	
	
	@Override
	public void Reservation() {
		// TODO Auto-generated method stub
		
	}

	
	
}