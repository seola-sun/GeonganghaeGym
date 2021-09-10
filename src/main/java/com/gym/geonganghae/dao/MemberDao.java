package com.gym.geonganghae.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
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
		// TODO Auto-generated method stub

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
		Object[] args = {dto.getId(), dto.getPassword()};
		return template.queryForObject(query, args, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));
	}

//	@SuppressWarnings("deprecation")
	public MemberDto contentView(String strID) {
		// TODO Auto-generated method stub

		String query = "select * from mvc_board where bId = " + strID;
//		return template.queryForObject(query, ParameterizedBeanPropertyRowMapper.newInstance(BDto.class));
		return template.queryForObject(query, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));

	}

//	public void modify(final String bId, final String bName, final String bTitle, final String bContent) {
//		// TODO Auto-generated method stub
//
//		String query = "update mvc_board set bName = ?, bTitle = ?, bContent = ? where bId = ?";
//
//		this.template.update(query, new PreparedStatementSetter() {
//
//			@Override
//			public void setValues(PreparedStatement ps) throws SQLException {
//				ps.setString(1, bName);
//				ps.setString(2, bTitle);
//				ps.setString(3, bContent);
//				ps.setInt(4, Integer.parseInt(bId));
//			}
//		});
//
//	}

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
