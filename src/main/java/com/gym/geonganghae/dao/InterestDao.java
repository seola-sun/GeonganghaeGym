package com.gym.geonganghae.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.dto.InterestDto;
import com.gym.geonganghae.dto.RecommendDto;
import com.gym.geonganghae.util.Constant;

@Repository
public class InterestDao {

	// 스프링 프레임워크에서 제공하는 JdbcTemplate 객체를 변수 선언
	JdbcTemplate template;

	private static InterestDao instance = new InterestDao();

	// 기본 생성자
	public InterestDao() {
		// JdbcTemplate객체에 dataSource의존성 주입하여 template변수 초기화
		this.template = Constant.template;
	}

	public static InterestDao getInstance() {
		return instance;
	}

	public ArrayList<InterestDto> list(final String loginId) {

		String query = "SELECT c.CENTER_NAME, " + "c.SPORTS_CODE, " + "i.center_Code, " + "c.usage_fee_min, "
				+ "c.interest_cnt, " + "c.recommend_cnt, " + "i.regdate "+ "FROM INTEREST i, CENTER c "
				+ "WHERE i.center_Code = c.center_Code " + "AND i.id = '" + loginId + "'";

		return (ArrayList<InterestDto>) template.query(query,
				new BeanPropertyRowMapper<InterestDto>(InterestDto.class));
	}

	public void delete(final String id, String centerCode) {
		String query = "DELETE FROM INTEREST WHERE ID = ? AND CENTER_CODE = ? ";

		this.template.update(query, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, id);
				ps.setString(2, centerCode);
			}
		});
	}

	// by설아, ajax 관심 등록 체크
	public int interestChk(String centerCode, String loginId) {
		int count = 0;

		String query = "SELECT * FROM INTEREST WHERE ID = ? AND CENTER_CODE = ?";
		Object[] args = { loginId, centerCode };

		ArrayList<InterestDto> list = (ArrayList<InterestDto>) template.query(query, args,
				new BeanPropertyRowMapper<InterestDto>(InterestDto.class));

		if (list.size() >= 1) {
			count = 1; // 이미 관심 등록 하고 있음
		} else {
			count = 0; // 관심 등록 가능
		}
		return count;
	}

	public void interUpdate(String centerCode, String userId) {
		try {
			// 유저가 해당 센터를 관심 등록 하고 있지 않은 경우만 관심 등록 추가
			String interestUpdate = "INSERT INTO INTEREST (SEQ, ID, CENTER_CODE) "
					+ "VALUES ((SELECT NVL(MAX(SEQ), 0) + 1 FROM INTEREST), ?, ?)";
			int updateCnt = this.template.update(interestUpdate, userId, centerCode);

			// 관심 테이블에 1건 추가된 경우에만 CENTER 테이블 관심 등록수 업데이트
			if (updateCnt == 1) {
				String centerUpdate = "UPDATE CENTER SET INTEREST_CNT = INTEREST_CNT + 1 WHERE CENTER_CODE = ?";
				this.template.update(centerUpdate, centerCode);
			}

		} catch (Exception e) {
			System.out.println("interUpdate : " + e);
			e.printStackTrace();
		}
	}

	public void interDelete(String centerCode, String userId) {
		try {
			String interestUpdate = "DELETE FROM INTEREST WHERE ID = ? AND CENTER_CODE = ?";
			int count = this.template.update(interestUpdate, userId, centerCode);

			// 관심 등록에 1건 삭제된 경우에만 CENTER 테이블 관심 등록수 업데이트
			if (count == 1) {
				String centerUpdate = "UPDATE CENTER SET INTEREST_CNT = INTEREST_CNT - 1 WHERE CENTER_CODE = ?";
				this.template.update(centerUpdate, centerCode);
			}

		} catch (Exception e) {
			System.out.println("interDelete : " + e);
			e.printStackTrace();
		}
	}

}
