package com.gym.geonganghae.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.InterestDto;
import com.gym.geonganghae.util.Constant;

@Repository
public class InterestDao {

	// 스프링 프레임워크에서 제공하는 JdbcTemplate 객체를 변수 선언
	JdbcTemplate template;

	// 기본 생성자
	public InterestDao() {
		// JdbcTemplate객체에 dataSource의존성 주입하여 template변수 초기화
		this.template = Constant.template;
	}

	public ArrayList<InterestDto> list(final String loginId) {

		String query = "SELECT i.id, "
							+ "i.center_Code, "
							+ "c.usage_fee_min, "
							+ "c.interest_cnt, "
							+ "i.regdate "
						+ "FROM INTEREST i, CENTER c "
						+ "WHERE i.center_Code = c.center_Code ";
		
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

}
