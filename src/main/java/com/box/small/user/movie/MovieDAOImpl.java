package com.box.small.user.movie;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDAOImpl implements MovieDAO{
	
	private final static String namespace="com.box.small.movieMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieDto> selectAllMovieLive(int cat_no) throws SQLException {
		return sqlSession.selectList(namespace+".selectAllMovieLive",cat_no);
	}

	@Override	
	public MovieDto selectMovie(int mo_no) throws SQLException {
		return sqlSession.selectOne(namespace+".selectMovie",mo_no);
	}

	@Override
	public String category(int cat_no) {
		return sqlSession.selectOne(namespace+".selectCategory", cat_no);
	}

	@Override
	public List<CategoryDto> allCategory() {
		return sqlSession.selectList(namespace+".selectAllCategory");
	}

	@Override
	public List<MovieDto> selectAllMovie() throws SQLException {
		return sqlSession.selectList(namespace+".selectAllMovie");
	}

	@Override
	public List<MovieDto> selectMovieCategory(int cat_no) {
		System.out.println("DAO selectMovieCategory 실행");
		return sqlSession.selectList(namespace+".selectMovieCategory", cat_no);
	}

    @Override
    public boolean checkMovieLike(MovieLikeDto ml) {
        return sqlSession.selectOne(namespace + ".checkMovieLike", ml);
    }

    @Override
    public int insertMovieLike(MovieLikeDto ml) {
        return sqlSession.insert(namespace + ".insertMovieLike", ml);
    }

    @Override
    public int updateMovieLike(MovieLikeDto ml) {
        return sqlSession.update(namespace + ".updateMovieLike", ml);
    }

    @Override
    public MovieLikeDto MovieLikeStatus(MovieLikeDto ml) {
        return sqlSession.selectOne(namespace + ".MovieLikeStatus", ml);
    }

	public List<MovieDto> moviePage(Map<String, Object> params) {
		return sqlSession.selectList(namespace+ ".moviePage",params);
	}


}
