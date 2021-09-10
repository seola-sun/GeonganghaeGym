package com.gym.geonganghae.dao;


import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.gym.geonganghae.dto.CenterDTO;
import com.gym.geonganghae.util.Constant;

public class CenterDAO {
	
	JdbcTemplate template;
	
	public CenterDAO() {
		this.template = Constant.template;
	}
	
	public ArrayList<CenterDTO> list(){
		String query = "SELECT c.CENTER_CODE, "
							+ "c.CENTER_NAME, "
							+ "s.SPORTS_NAME, "
							+ "c.USAGE_FEE_MIN, "
							+ "c.USAGE_FEE_MAX, "
							+ "c.INTEREST_CNT, "
							+ "c.RECOMMEND_CNT "
					 + "FROM CENTER c, SPORTS s "
					 + "WHERE c.SPORTS_CODE = s.SPORTS_CODE "
					 + "ORDER BY REGDATE";
		return (ArrayList<CenterDTO>) template.query(query, new BeanPropertyRowMapper<CenterDTO>(CenterDTO.class));
	}
	
	public CenterDTO centerView(String centerCode) {
		String query = "SELECT * FROM CENTER WHERE CENTER_CODE = '" + centerCode + "'";
		return template.queryForObject(query, new BeanPropertyRowMapper<CenterDTO>(CenterDTO.class));
	}
	
}
