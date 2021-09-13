package com.gym.geonganghae.dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.util.Constant;

@Repository
public class CenterDao {

	JdbcTemplate template;

	public CenterDao() {
		this.template = Constant.template;
	}

	public ArrayList<CenterDto> list() {
		String query = "SELECT c.CENTER_CODE, " + "c.CENTER_NAME, " + "s.SPORTS_NAME, " + "c.USAGE_FEE_MIN, "
				+ "c.USAGE_FEE_MAX, " + "c.INTEREST_CNT, " + "c.RECOMMEND_CNT " + "FROM CENTER c, SPORTS s "
				+ "WHERE c.SPORTS_CODE = s.SPORTS_CODE " + "ORDER BY REGDATE";
		return (ArrayList<CenterDto>) template.query(query, new BeanPropertyRowMapper<CenterDto>(CenterDto.class));
	}

	public CenterDto centerView(String centerCode) {
		String query = "SELECT * FROM CENTER WHERE CENTER_CODE = '" + centerCode + "'";
		return template.queryForObject(query, new BeanPropertyRowMapper<CenterDto>(CenterDto.class));
	}

	// 관심 등록 체크
	public boolean chkInterest(String centerCode, String loginId) {
		// INTEREST 테이블에 이미 해당 유저가 해당 센터를 관심 등록 하고 있는지 체크하는 쿼리.
		String check = "SELECT COUNT(*) FROM INTEREST WHERE ID = ? AND CENTER_CODE = ?";
		Object[] args = { loginId, centerCode };
		int selCount = template.queryForObject(check, args, Integer.class);

		if (selCount >= 1) {
			return true;
		} else {
			return false;
		}
	}

	// 관심 등록
	public void addInterest(String centerCode, String loginId) {

		if (chkInterest(centerCode, loginId)) {
			return; // 1건 이상 조회된 경우, 관심 등록하지 않고 리턴
		}

		// 이미 유저가 이미 해당 센터를 관심 등록하고 있지 않은 경우만 관심 등록 추가
		String interUpdate = "INSERT INTO INTEREST (ID, CENTER_CODE) VALUES (?, ?)";
		int updateCnt = this.template.update(interUpdate, loginId, centerCode);

		// 관심 등록에 1건 추가된 경우에만 CENTER 테이블 관심등록수 업데이트
		if (updateCnt == 1) {
			String centerUpdate = "UPDATE CENTER SET INTEREST_CNT = INTEREST_CNT + 1 WHERE CENTER_CODE = ?";
			this.template.update(centerUpdate, centerCode);
		}

	}

	// 관심 등록 해제
	public void delInterest(String centerCode, String loginId) {

		String interUpdate = "DELETE FROM INTEREST WHERE ID = ? AND CENTER_CODE = ?";
		int count = this.template.update(interUpdate, loginId, centerCode);

		// 관심 등록에 1건 삭제된 경우에만 CENTER 테이블 관심등록수 업데이트
		if (count == 1) {
			String centerUpdate = "UPDATE CENTER SET INTEREST_CNT = INTEREST_CNT - 1 WHERE CENTER_CODE = ?";
			this.template.update(centerUpdate, centerCode);
		}

	}

	// 추천 등록 체크
	public boolean chkRecommend(String centerCode, String loginId) {
		// INTEREST 테이블에 이미 해당 유저가 해당 센터를 관심 등록 하고 있는지 체크하는 쿼리.
		String check = "SELECT COUNT(*) FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
		Object[] args = { loginId, centerCode };
		int selCount = template.queryForObject(check, args, Integer.class);

		if (selCount >= 1) {
			return true;
		} else {
			return false;
		}
	}

	// 추천 하기
	public void addRecommend(String centerCode, String loginId) {

		if (chkRecommend(centerCode, loginId)) {
			return; // 1건 이상 조회된 경우, 추천 하지 않고 리턴
		}

		// 유저가 해당 센터를 추천하고 있지 않은 경우만 관심 등록 추가
		String recommendUpdate = "INSERT INTO RECOMMEND (ID, CENTER_CODE) VALUES (?, ?)";
		int updateCnt = this.template.update(recommendUpdate, loginId, centerCode);

		// 추천 테이블에 1건 추가된 경우에만 CENTER 테이블 관심등록수 업데이트
		if (updateCnt == 1) {
			String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT + 1 WHERE CENTER_CODE = ?";
			this.template.update(centerUpdate, centerCode);
		}

	}

	// 추천 취소
	public void delRecommend(String centerCode, String loginId) {

		String recommendUpdate = "DELETE FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
		int count = this.template.update(recommendUpdate, loginId, centerCode);

		// 관심 등록에 1건 삭제된 경우에만 CENTER 테이블 관심등록수 업데이트
		if (count == 1) {
			String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT - 1 WHERE CENTER_CODE = ?";
			this.template.update(centerUpdate, centerCode);
		}

	}

}
