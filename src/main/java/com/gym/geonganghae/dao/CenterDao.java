package com.gym.geonganghae.dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.util.Constant;

/**
 * @author 설아
 * @summary 데이터베이스 연동을 담당하는 클래스이다.
 * CRUD(Create, Read, Update, Delete) 기능의 메소드가 구현되어있다.
 */
@Repository
public class CenterDao 
{
	// by설아, 스프링 프레임워크에서 제공하는 JdbcTemplate 객체를 변수 선언
	JdbcTemplate template;

	// by설아, 기본 생성자
	public CenterDao() 
	{
		// by설아, JdbcTemplate객체에 dataSource의존성 주입하여 template변수 초기화
		this.template = Constant.template;
	}

	// by설아, 센터 목록을 조회하는 메소드
	public ArrayList<CenterDto> list() 
	{
		// by설아, 센터 테이블이 스포츠 코드를 스포츠 명으로 표시하기 위해,
		// 스포츠 테이블 INNER JOIN
		String query = "SELECT c.CENTER_CODE, "
						+ "c.CENTER_NAME, " 
						+ "s.SPORTS_NAME, " 
						+ "c.USAGE_FEE_MIN, "
						+ "c.USAGE_FEE_MAX, " 
						+ "c.INTEREST_CNT, " 
						+ "c.RECOMMEND_CNT " 
						+ "FROM CENTER c, SPORTS s "
						+ "WHERE c.SPORTS_CODE = s.SPORTS_CODE " 
						+ "ORDER BY REGDATE";
		
		// by설아, JdbcTemplate의 query()메소드로 CenterDto의 목록을 가져온다.
		// query메소드의 두번째 인자로 RowMapper객체를 사용하여 검색결과를 Dto객체에 매핑한다.
		return (ArrayList<CenterDto>) template.query(query, 
				new BeanPropertyRowMapper<CenterDto>(CenterDto.class));
	}

	// by설아, 센터 코드로 센터의 상세 정보를 조회하는 메소드
	public CenterDto centerView(String centerCode) 
	{
		// by설아, 센터 코드에 해당하는 센터 한 건을 검색한다.
		String query = "SELECT * FROM CENTER WHERE CENTER_CODE = '" 
						+ centerCode + "'";
		
		// by설아, JdbcTemplate의 queryForObject()메소드로 
		// 단 하나의 CenterDto객체를 검색한다. 
		return template.queryForObject(query, 
				new BeanPropertyRowMapper<CenterDto>(CenterDto.class));
	}

	// by설아, 관심 등록 체크하는 메소드
	public boolean chkInterest(String centerCode, String loginId) 
	{
		// INTEREST 테이블에 이미 해당 유저가 해당 센터를 관심 등록 하고 있는지 체크하는 쿼리.
		String check = "SELECT COUNT(*) FROM INTEREST "
						+ "WHERE ID = ? AND CENTER_CODE = ?";
		
		// by설아, 쿼리 스트링의 ?에 값을 설정하기 위한 배열 객체이다.
		Object[] args = { loginId, centerCode };
		
		// by설아, 두번째 인자로 위에서 설정한 배열 객체를 전달하고,
		// row의 개수를 결과값으로 가져오기 위해 세번째 인자로 Integer클래스를 전달한다.
		int selCount = template.queryForObject(check, args, Integer.class);

		if (selCount >= 1) 
		{
			// by설아, 로그인한 회원이 이미 해당 센터를 관심등록하고 있다면 true를 리턴
			return true;
		} 
		else 
		{
			// by설아, 로그인한 회원이 해당 센터를 관심등록 하고 있지 않다면 false를 리턴
			return false;
		}
	}

	// by설아, 관심 등록 기능 메소드
	public void addInterest(String centerCode, String loginId) 
	{
		if (chkInterest(centerCode, loginId)) 
		{
			// by설아, 로그인한 회원이 이미 해당 센터를 관심등록하고 있다면 
			// 관심 등록하지 않고 그대로 리턴
			return; 
		}

		// by설아, 회원이 해당 센터를 관심 등록하고 있지 않은 경우만 관심 등록 추가
		String interUpdate = "INSERT INTO INTEREST (ID, CENTER_CODE) "
							+ "VALUES (?, ?)";
		
		// by설아, 쿼리문의 ?에 값을 설정하기 위해 ?의 수만큼 
		// 차례대로 update()메소드의 두번째 인자부터 나열한다.
		int updateCnt = this.template.update(interUpdate, loginId, centerCode);

		// by설아, 관심 등록하여 INTEREST 테이블에 1건이 추가된 경우에만
		// CENTER 테이블 관심 등록수 업데이트
		if (updateCnt == 1) 
		{
			String centerUpdate = "UPDATE CENTER "
								+ "SET INTEREST_CNT = INTEREST_CNT + 1 "
								+ "WHERE CENTER_CODE = ?";
			
			// by설아, JdbcTemplate의 update()메소드를 사용하여 쿼리문을 처리한다.
			this.template.update(centerUpdate, centerCode);
		}
	}

	// 관심 등록 취소
	public void delInterest(String centerCode, String loginId) 
	{
		String interUpdate = "DELETE FROM INTEREST WHERE ID = ? AND CENTER_CODE = ?";
		int count = this.template.update(interUpdate, loginId, centerCode);

		// 관심 등록에 1건 삭제된 경우에만 CENTER 테이블 관심등록수 업데이트
		if (count == 1) 
		{
			String centerUpdate = "UPDATE CENTER SET INTEREST_CNT = INTEREST_CNT - 1 WHERE CENTER_CODE = ?";
			this.template.update(centerUpdate, centerCode);
		}
	}

	// 추천 등록 체크
	public boolean chkRecommend(String centerCode, String loginId) 
	{
		// INTEREST 테이블에 이미 해당 유저가 해당 센터를 관심 등록 하고 있는지 체크하는 쿼리.
		String check = "SELECT COUNT(*) FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
		Object[] args = { loginId, centerCode };
		int selCount = template.queryForObject(check, args, Integer.class);

		if (selCount >= 1) 
		{
			return true;
		} 
		else 
		{
			return false;
		}
	}

	// 추천 하기
	public void addRecommend(String centerCode, String loginId) 
	{
		if (chkRecommend(centerCode, loginId)) 
		{
			return; // 1건 이상 조회된 경우, 추천 하지 않고 리턴
		}

		// 유저가 해당 센터를 추천하고 있지 않은 경우만 관심 등록 추가
		String recommendUpdate = "INSERT INTO RECOMMEND (ID, CENTER_CODE) VALUES (?, ?)";
		int updateCnt = this.template.update(recommendUpdate, loginId, centerCode);

		// 추천 테이블에 1건 추가된 경우에만 CENTER 테이블 관심등록수 업데이트
		if (updateCnt == 1) 
		{
			String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT + 1 WHERE CENTER_CODE = ?";
			this.template.update(centerUpdate, centerCode);
		}
	}

	// 추천 취소
	public void delRecommend(String centerCode, String loginId) 
	{
		String recommendUpdate = "DELETE FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
		int count = this.template.update(recommendUpdate, loginId, centerCode);

		// 관심 등록에 1건 삭제된 경우에만 CENTER 테이블 관심등록수 업데이트
		if (count == 1) 
		{
			String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT - 1 WHERE CENTER_CODE = ?";
			this.template.update(centerUpdate, centerCode);
		}
	}
}
