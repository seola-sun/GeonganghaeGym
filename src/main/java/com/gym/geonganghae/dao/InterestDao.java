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
import com.gym.geonganghae.util.Constant;

@Repository
public class InterestDao {

	// 스프링 프레임워크에서 제공하는 JdbcTemplate 객체를 변수 선언
	JdbcTemplate template;

	// private SqlSession session;
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

		String query = "SELECT i.id, " + "i.center_Code, " + "c.usage_fee_min, " + "c.interest_cnt, " + "i.regdate "
				+ "FROM INTEREST i, CENTER c " + "WHERE i.center_Code = c.center_Code " + "AND i.id = '" + loginId
				+ "'";

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

	// 게시글 추천여부 검사
	public int recCheck(String centerCode, String loginId) {
		int result = 0;
		try {
			// session = getSession();
			// result = (Integer) session.selectOne("board.rec_check", m);

			// RECOMMEND 테이블에 이미 해당 유저가 해당 센터를 관심 등록 하고 있는지 체크하는 쿼리.
			String check = "SELECT COUNT(*) FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
			Object[] args = { loginId, centerCode };
			result = template.queryForObject(check, args, Integer.class);
			System.out.println("InterestDao result 값 : " + result);

		} catch (Exception e) {
			System.out.println("recCheck : " + e);
			e.printStackTrace();
		}
		return result;
	}

	// 게시글 추천
	public void recUpdate(String centerCode, String loginId) {
		try {
			// session = getSession();
			// session.insert("board.rec_update", m);

//				if (chkRecommend(centerCode, loginId)) 
//				{
//					return; // 1건 이상 조회된 경우, 추천 하지 않고 리턴
//				}

			// 유저가 해당 센터를 추천하고 있지 않은 경우만 관심 등록 추가
			String recommendUpdate = "INSERT INTO RECOMMEND (ID, CENTER_CODE) VALUES (?, ?)";
			int updateCnt = this.template.update(recommendUpdate, loginId, centerCode);

			// 추천 테이블에 1건 추가된 경우에만 CENTER 테이블 관심등록수 업데이트
			if (updateCnt == 1) {
				String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT + 1 WHERE CENTER_CODE = ?";
				this.template.update(centerUpdate, centerCode);
			}

		} catch (Exception e) {
			System.out.println("recUpdate : " + e);
			e.printStackTrace();
		}
	}

	// 게시글 추천 제거
	public void recDelete(String centerCode, String loginId) {
		try {
			// session = getSession();
			// session.insert("board.rec_delete", m);

			String recommendUpdate = "DELETE FROM RECOMMEND WHERE ID = ? AND CENTER_CODE = ?";
			int count = this.template.update(recommendUpdate, loginId, centerCode);

			// 관심 등록에 1건 삭제된 경우에만 CENTER 테이블 관심등록수 업데이트
			if (count == 1) {
				String centerUpdate = "UPDATE CENTER SET RECOMMEND_CNT = RECOMMEND_CNT - 1 WHERE CENTER_CODE = ?";
				this.template.update(centerUpdate, centerCode);
			}

		} catch (Exception e) {
			System.out.println("recDelete : " + e);
			e.printStackTrace();
		}
	}

	// 게시글 추천수
	public int recCount(String centerCode) {
		int count = 0;
		try {
			// session = getSession();
			// count = (Integer) session.selectOne("board.rec_count", no);

			String check = "SELECT COUNT(*) FROM RECOMMEND WHERE CENTER_CODE = ?";
			Object[] args = { centerCode };
			count = template.queryForObject(check, args, Integer.class);

		} catch (Exception e) {
			System.out.println("recCount : " + e);
			e.printStackTrace();
		}
		return count;
	}

}
