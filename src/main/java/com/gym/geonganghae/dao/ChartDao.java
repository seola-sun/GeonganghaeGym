package com.gym.geonganghae.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.gym.geonganghae.dto.ChartDto;
import com.gym.geonganghae.util.Constant;


@Service
public class ChartDao {
	 	
		 JdbcTemplate template;

			
			public ChartDao() {
				this.template = Constant.template;
			}
			private final String GET_MEMBER_VALUES="select count,month from view_member_chart";
			private final String GET_CENTER_VALUES= "select *from view_center_chart";
			private final String GET_INTEREST_VALUES= "select *from view_interest_chart";
			private final String GET_SPORTS_VALUES="select *from view_sports_chart";
			
			public List<ChartDto> getMemberChart(ChartDto dto){
				 return template.query(GET_MEMBER_VALUES, new MemberRowMapper());	
			}
			
			public List<ChartDto> getCenterChart(ChartDto dto){
				return template.query(GET_CENTER_VALUES, new CentertRowMapper());	
			}

			public List<ChartDto> getInterestChart(ChartDto dto){
				return template.query(GET_INTEREST_VALUES, new InterestRowMapper());		
			}
			
			public List<ChartDto> getSportsChart(ChartDto dto){
					return template.query(GET_SPORTS_VALUES, new SportsRowMapper());		
			}
				
}

class CentertRowMapper implements RowMapper<ChartDto>{
	public ChartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		ChartDto centerChart = new ChartDto();
		centerChart.setValue(rs.getInt("COUNT"));
		centerChart.setIndex(rs.getString("MONTH"));

		return  centerChart;
	}
}

class InterestRowMapper implements RowMapper<ChartDto>{
	public ChartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		ChartDto interestChart = new ChartDto();
		interestChart.setValue(rs.getInt("COUNT"));
		interestChart.setIndex(rs.getString("MONTH"));

		return  interestChart;
	}
}

class MemberRowMapper implements RowMapper<ChartDto>{
	public ChartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		ChartDto membertChart = new ChartDto();
		membertChart.setValue(rs.getInt("COUNT"));
		membertChart.setIndex(rs.getString("MONTH"));

		return  membertChart;
	}
}

class SportsRowMapper implements RowMapper<ChartDto>{
	public ChartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		ChartDto sportsChart = new ChartDto();
		sportsChart.setValue(rs.getInt("COUNT"));
		sportsChart.setIndex(rs.getString("SPORTS"));

		return  sportsChart;
	}
}