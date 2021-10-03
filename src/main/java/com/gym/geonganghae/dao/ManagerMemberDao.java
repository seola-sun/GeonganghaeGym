package com.gym.geonganghae.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.gym.geonganghae.dto.ManagerMemberDto;
import com.gym.geonganghae.util.Constant;

public class ManagerMemberDao {

	JdbcTemplate template;
	
	public ManagerMemberDao() {
		this.template = Constant.template;
	}
	
	public ArrayList<ManagerMemberDto> list(String searchCondition, String searchKeyword) {
		String condition="";
		if(searchCondition!=null&&searchKeyword!=null)
		{
			if(searchCondition.equals("name") && searchKeyword!="" )
			{
				condition = "where "+searchCondition+" like '%"+searchKeyword+"%' ";
			}
			else if(searchCondition.equals("id") && searchKeyword!="" )
			{
				condition = "where "+searchCondition+" like '%"+searchKeyword+"%' ";
			}
		}
		String query = "select id, password, name, tel_number, email, regdate, moddate from member " +condition +"order by regdate desc";
		return (ArrayList<ManagerMemberDto>) template.query(query, new BeanPropertyRowMapper<ManagerMemberDto>(ManagerMemberDto.class));
		
	}
	
//	@SuppressWarnings("deprecation")
	public ManagerMemberDto contentView(String strID) {
		// TODO Auto-generated method stub
		
		String query = "select * from member where id = '" + strID + "'";
//		return template.queryForObject(query, ParameterizedBeanPropertyRowMapper.newInstance(BDto.class));
		return template.queryForObject(query, new BeanPropertyRowMapper<ManagerMemberDto>(ManagerMemberDto.class));
		
	}
	
	public ManagerMemberDto modifyView(String strID) {
		// TODO Auto-generated method stub
		
		String query = "select * from member where id = '" + strID + "'";
//		return template.queryForObject(query, ParameterizedBeanPropertyRowMapper.newInstance(BDto.class));
		return template.queryForObject(query, new BeanPropertyRowMapper<ManagerMemberDto>(ManagerMemberDto.class));
		
	}
	
	public void modify(final String id, final String name, final String tel_number, final String email) {
		// TODO Auto-generated method stub
		
		String query = "update member set name = ?, tel_number = ?, email = ?, moddate = sysdate where id = ?";
		
		
		this.template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, name);
				ps.setString(2, tel_number);
				ps.setString(3, email);
//				ps.setDate(6, 칼럼명);
				ps.setString(4, id);
			}
		});
		
	}
	
	public void delete(final String id) {
		// TODO Auto-generated method stub
		String query = "delete from member where id = ?";
		
		this.template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, id);
			}
		});
		
	}

	
}
