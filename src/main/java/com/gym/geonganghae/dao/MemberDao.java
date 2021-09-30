package com.gym.geonganghae.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.MemberDto;
import com.gym.geonganghae.util.Constant;

/**
 * @author 설아
 * @summary DB연동을 위해 JdbcTemplate객체를 이용한 DAO클래스 구현
 */
@Repository
public class MemberDao {
	// 스프링 프레임워크에서 제공하는 JdbcTemplate 객체를 변수 선언
	JdbcTemplate template;

	private static MemberDao instance = new MemberDao();

	// 기본 생성자
	public MemberDao() {
		// JdbcTemplate객체에 dataSource의존성 주입하여 template변수 초기화
		this.template = Constant.template;
	}

	public static MemberDao getInstance() {
		return instance;
	}

	public int registerCheck(String id) {
		int result = 0;

		String query = "SELECT * FROM MEMBER WHERE ID = ? ";
		Object[] args = { id };

		ArrayList<MemberDto> list = (ArrayList<MemberDto>) template.query(query, args,
				new BeanPropertyRowMapper<MemberDto>(MemberDto.class));

		if (list.size() == 1) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	public void write(final String id, final String password, final String name, final String tel_number,
			final String email) {
		String query = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?, SYSDATE, SYSDATE, 'N')";
		Object[] args = { id, password, name, tel_number, email };
		this.template.update(query, args);
	}

	public ArrayList<MemberDto> list() {

		String query = "SELECT * FROM MEMBER ORDER BY REGDATE DESC";
		return (ArrayList<MemberDto>) template.query(query, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));
	}

	// dto를 매개변수로 받아 회원을 검색하는 메소드
	public MemberDto getUser(MemberDto dto) {
		String query = "SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD = ?";
		Object[] args = { dto.getId(), dto.getPassword() };

		// 아이디와 비밀번호가 존재하는 단 한 명의 회원을 찾아 MemberDto객체로 리턴
		return template.queryForObject(query, args, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));
	}

//	@SuppressWarnings("deprecation")
	public MemberDto memberView(String strID) {

		String query = "SELECT * FROM MEMBER WHERE ID = '" + strID + "'";
		return template.queryForObject(query, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));

	}

	public void modify(final String password, final String name, final String tel_number, final String email,
			final String id) {
		String query = "UPDATE MEMBER SET PASSWORD = ?, NAME = ?, TEL_NUMBER = ?, EMAIL = ? WHERE ID = ?";
		Object[] args = { password, name, tel_number, email, id };
		this.template.update(query, args);
	}

	public void delete(final String id) {
		String query = "DELETE FROM MEMBER WHERE ID = ?";

		this.template.update(query, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, id);
			}
		});
	}

}
