package com.gym.geonganghae.dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.RecommendDto;
import com.gym.geonganghae.util.Constant;

@Repository
public class RecommendDao {

	// 스프링 프레임워크에서 제공하는 JdbcTemplate 객체를 변수 선언
	JdbcTemplate template;

	private static RecommendDao instance = new RecommendDao();

	// 기본 생성자
	public RecommendDao() {
		// JdbcTemplate객체에 dataSource의존성 주입하여 template변수 초기화
		this.template = Constant.template;
	}

	public static RecommendDao getInstance() {
		return instance;
	}

	public int recommendChk(String centerCode, String loginId) {
		int count = 0;

		String query = "SELECT * FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
		Object[] args = { loginId, centerCode };

		ArrayList<RecommendDto> list = (ArrayList<RecommendDto>) template.query(query, args,
				new BeanPropertyRowMapper<RecommendDto>(RecommendDto.class));

		if (list.size() >= 1) {
			count = 1; // 이미 추천하고 있음
		} else {
			count = 0; // 추천 가능
		}
		return count;
	}

	public void recUpdate(String centerCode, String userId) {
		try {
			// 유저가 해당 센터를 추천하고 있지 않은 경우만 추천 테이블에 추가
			String recommendUpdate = "INSERT INTO RECOMMEND (SEQ, ID, CENTER_CODE) "
									+ "VALUES ((SELECT NVL(MAX(SEQ), 0) + 1 FROM RECOMMEND), ?, ?)";
			int updateCnt = this.template.update(recommendUpdate, userId, centerCode);

			// 추천 테이블에 1건 추가된 경우에만 CENTER 테이블 추천수 업데이트
			if (updateCnt == 1) {
				String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT + 1 WHERE CENTER_CODE = ?";
				this.template.update(centerUpdate, centerCode);
			}

		} catch (Exception e) {
			System.out.println("recUpdate : " + e);
			e.printStackTrace();
		}
		
	}

	public void recDelete(String centerCode, String userId) {
		try {
			String recommendUpdate = "DELETE FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
			int count = this.template.update(recommendUpdate, userId, centerCode);

			// 추천테이블 1건 삭제된 경우에만 CENTER 테이블 추천수 업데이트
			if (count == 1) {
				String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT - 1 WHERE CENTER_CODE = ?";
				this.template.update(centerUpdate, centerCode);
			}

		} catch (Exception e) {
			System.out.println("recDelete : " + e);
			e.printStackTrace();
		}
	}

}
