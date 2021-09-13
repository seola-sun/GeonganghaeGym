package com.gym.geonganghae.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.gym.geonganghae.dto.MemberDto;
import com.gym.geonganghae.util.Constant;

@Repository
public class MemberDao {

	JdbcTemplate template;

	public MemberDao() {
		this.template = Constant.template;
	}

	public void write(final String id, final String password, final String name, final String tel_number,
			final String email, final String zipcode, final String address) {

		this.template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String query = "insert into member values (?, ?, ?, ?, ?, ?, ? , sysdate)";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, name);
				pstmt.setString(4, tel_number);
				pstmt.setString(5, email);
				pstmt.setString(6, zipcode);
				pstmt.setString(7, address);

				return pstmt;
			}
		});
	}

	public ArrayList<MemberDto> list() {

		String query = "select * from member order by regdate desc";
		return (ArrayList<MemberDto>) template.query(query, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));
	}

	public MemberDto getUser(MemberDto dto) {
		String query = "select * from member where id=? and password=?";
		Object[] args = { dto.getId(), dto.getPassword() };
		return template.queryForObject(query, args, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));
	}

//	@SuppressWarnings("deprecation")
	public MemberDto memberView(String strID) {

		String query = "select * from member where Id = '" + strID + "'";
//		return template.queryForObject(query, ParameterizedBeanPropertyRowMapper.newInstance(BDto.class));
		return template.queryForObject(query, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));

	}

	public void modify(final String password, final String name, final String tel_number, final String email,
			final String zipcode, final String address, final String id) {

		String query = "update member set password = ?, name = ?, tel_number = ?, email = ?, zipcode = ?, address = ? where id = ?";

		this.template.update(query, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, password);
				ps.setString(2, name);
				ps.setString(3, tel_number);
				ps.setString(4, email);
				ps.setString(5, zipcode);
				ps.setString(6, address);
				ps.setString(7, id);
			}
		});

	}

//	public void delete(final String bId) {
//		// TODO Auto-generated method stub
//		String query = "delete from mvc_board where bId = ?";
//
//		this.template.update(query, new PreparedStatementSetter() {
//
//			@Override
//			public void setValues(PreparedStatement ps) throws SQLException {
//				ps.setString(1, bId);
//			}
//		});
//
//	}

}
