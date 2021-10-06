package com.gym.geonganghae.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.dto.ChartDto;
import com.gym.geonganghae.util.Constant;

/**
 * @author 설아
 * @summary 데이터베이스 연동을 담당하는 클래스이다. CRUD(Create, Read, Update, Delete) 기능의 메소드가
 *          구현되어있다.
 */
@Repository
public class CenterDao {
	// by설아, 스프링 프레임워크에서 제공하는 JdbcTemplate 객체를 변수 선언
	JdbcTemplate template;

	// by설아, 기본 생성자
	public CenterDao() {
		// by설아, JdbcTemplate객체에 dataSource의존성 주입하여 template변수 초기화
		this.template = Constant.template;
	}

	// by설아, 센터 목록을 조회하는 메소드
	public ArrayList<CenterDto> list() {
		// by설아, 센터 테이블이 스포츠 코드를 스포츠 명으로 표시하기 위해,
		// 스포츠 테이블 INNER JOIN
		String query = "SELECT c.CENTER_CODE, " + "c.CENTER_NAME, " + "s.SPORTS_NAME, " + "c.USAGE_FEE_MIN, "
				+ "c.USAGE_FEE_MAX, " + "c.INTEREST_CNT, " + "c.RECOMMEND_CNT " + "FROM CENTER c, SPORTS s "
				+ "WHERE c.SPORTS_CODE = s.SPORTS_CODE " + "ORDER BY REGDATE";

		// by설아, JdbcTemplate의 query()메소드로 CenterDto의 목록을 가져온다.
		// query메소드의 두번째 인자로 RowMapper객체를 사용하여 검색결과를 Dto객체에 매핑한다.
		return (ArrayList<CenterDto>) template.query(query, new BeanPropertyRowMapper<CenterDto>(CenterDto.class));
	}

	// by설아, 센터 코드로 센터의 상세 정보를 조회하는 메소드
	public CenterDto centerView(String centerCode) {
		// by설아, 센터 코드에 해당하는 센터 한 건을 검색한다.
		String query = "SELECT * FROM CENTER WHERE CENTER_CODE = '" + centerCode + "'";

		// by설아, JdbcTemplate의 queryForObject()메소드로
		// 단 하나의 CenterDto객체를 검색한다.
		return template.queryForObject(query, new BeanPropertyRowMapper<CenterDto>(CenterDto.class));
	}

}