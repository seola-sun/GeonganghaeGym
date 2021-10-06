package com.gym.geonganghae.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.gym.geonganghae.dao.ManagerCenterDAO;
import com.gym.geonganghae.dto.ManagerCenterDTO;
import com.gym.geonganghae.util.Constant;


public class ManagerCenterDAO {
	
	JdbcTemplate template;
	
	public ManagerCenterDAO() {
		this.template = Constant.template;
	}
	
	public ArrayList<ManagerCenterDTO> list(String centerNameKeyword, String[] sportsNameKeyword, String sidoKeyword, String sigunguKeyword, 
		  String usageMinFeeKeyword, String usageMaxFeeKeyword){
		String find_centerName = "";
		String find_sportsName = "";
		String find_usageMinFee = "";
		String find_usageMaxFee = "";
		String find_centeraddress = "";
		if(sportsNameKeyword!=null)
		{
			find_sportsName = "and s.SPORTS_NAME IN (";
			for(int i = 0; i<sportsNameKeyword.length;i++)
			{
				if(i == (sportsNameKeyword.length - 1))
				{
					find_sportsName+="'"+sportsNameKeyword[i]+"'";
				}
				else
				{
					find_sportsName+="'"+sportsNameKeyword[i]+"', ";
				}
			}
			find_sportsName += ") ";
		}
		if(centerNameKeyword!=null&&usageMinFeeKeyword!=null&&usageMaxFeeKeyword!=null)
		{
			if(centerNameKeyword!="")
				find_centerName = "and c.CENTER_NAME like '%" + centerNameKeyword + "%' ";
//			if(usageMinFeeKeyword!="")
//			{
//				find_usageMinFee = "and c.USAGE_FEE_MIN = "+usageMinFeeKeyword+" ";
//			}
//			if(usageMaxFeeKeyword!="")
//			{
//				find_usageMaxFee = "and c.USAGE_FEE_MAX = "+usageMaxFeeKeyword+" ";
//			}
			String minfee="0";
			String maxfee="99999999999";
			if(usageMinFeeKeyword!="")
			 {
				minfee=usageMinFeeKeyword;
			 }
			if(usageMaxFeeKeyword!="")
			 {
				maxfee=usageMaxFeeKeyword;
			 }
			find_usageMinFee = "and c.USAGE_FEE_MIN between " + minfee + " and "+ maxfee +" ";
			find_usageMaxFee = "and c.USAGE_FEE_MAX between " + minfee + " and "+ maxfee +" ";
		}
		if(sidoKeyword!=null && sigunguKeyword!=null)
		{
			if(!sidoKeyword.equals("전체") && !sigunguKeyword.equals("전체"))
			{
				find_centeraddress = "and c.ADDRESS like '%" + sidoKeyword+" "+sigunguKeyword+"%' ";
			}
			if(!sidoKeyword.equals("전체") && sigunguKeyword.equals("전체"))
			{
			
				find_centeraddress = "and c.ADDRESS like '%" + sidoKeyword+"%' ";
			}
			//find_centeraddress = "and c.ADDRESS like '%" + sidoKeyword+" "+sigunguKeyword+"%' ";
		}

		
		String query = "SELECT c.CENTER_CODE, "
							+ "c.CENTER_NAME, "
							+ "s.SPORTS_NAME, "
							+ "c.USAGE_FEE_MIN, "
							+ "c.USAGE_FEE_MAX, "
							+ "c.INTEREST_CNT, "
							+ "c.RECOMMEND_CNT "
					 + "FROM CENTER c, SPORTS s "
					 + "WHERE c.SPORTS_CODE = s.SPORTS_CODE " + find_centerName + find_sportsName + find_usageMinFee + find_usageMaxFee + find_centeraddress
					 + "ORDER BY REGDATE";
		return (ArrayList<ManagerCenterDTO>) template.query(query, new BeanPropertyRowMapper<ManagerCenterDTO>(ManagerCenterDTO.class));
	}
	
	public ManagerCenterDTO centerView(String centerCode) {
		System.out.println("dtocenterview");
		System.out.println(centerCode);
		String query = "SELECT c.CENTER_CODE, c.CENTER_NAME, c.SPORTS_CODE, s.SPORTS_NAME, c.TEL_NUMBER, "
				+ "c.ZIPCODE, c.ADDRESS, c.LATITUDE, c.LONGITUDE, c.DAYOFF, "
				+ "c.OPERATING_TIME, c.USAGE_FEE_MIN, c.USAGE_FEE_MAX, c.REGFEE, c.OPEN_DATE, "
				+ "c.THUMBNAIL, c.IMAGE, c.DETAIL, c.INTEREST_CNT, c.RECOMMEND_CNT, c.REGDATE "
				+ "FROM CENTER c, SPORTS s "
				+ "WHERE c.SPORTS_CODE = s.SPORTS_CODE "
				+ "AND c.CENTER_CODE = '" + centerCode +"'";
		return template.queryForObject(query, new BeanPropertyRowMapper<ManagerCenterDTO>(ManagerCenterDTO.class));
	}
	public ManagerCenterDTO centermodifyView(String centerCode) {
		// TODO Auto-generated method stub
		
		String query = "select c.center_code, c.center_name, s.sports_name, c.tel_number, c.zipcode, " 
							+ "c.address, c.latitude, c.longitude, c.dayoff, c.operating_time, "
							+ "c.usage_fee_min, c.usage_fee_max, c.regFee, c.open_date, c.thumbnail, "
							+ "c.image, c.detail from center c, sports s "
							+ "WHERE c.SPORTS_CODE = s.SPORTS_CODE "
							+ "and center_code = '" + centerCode + "'";
//		return template.queryForObject(query, ParameterizedBeanPropertyRowMapper.newInstance(BDto.class));
		return template.queryForObject(query, new BeanPropertyRowMapper<ManagerCenterDTO>(ManagerCenterDTO.class));
		
	}
	public void centerWrite(final String centerCode, final String centerName, final String telNumber, 
			final String zipCode, final String address, final float latitude, final float longitude, final String dayoff, 
			final String operatingTime, final int usageFeeMin, final int usageFeeMax, final int regFee, 
			final String openDate, final String thumbnail, final String image, final String detail, final String sportsName) {
		this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				String query = "insert into center (center_code, center_name, sports_code, tel_number, zipcode, "
						+ "address, latitude, longitude, dayoff, operating_time, "
						+ "usage_fee_min, usage_fee_max, regFee, open_date, thumbnail, "
						+ "image, detail, regdate) "
						+ "select ?, ?, sports_code, ?, ?, "
						+ "?, ?, ?, ?, ?, "
						+ "?, ?, ?, ?, ?, "
						+ "?, ?, sysdate "
						+ "from sports "
						+ "where sports_name = ?";	
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, centerCode);
				pstmt.setString(2, centerName);
				pstmt.setString(3, telNumber);
				pstmt.setString(4, zipCode);
				pstmt.setString(5, address);
				pstmt.setFloat(6, latitude);
				pstmt.setFloat(7, longitude);
				pstmt.setString(8, dayoff);
				pstmt.setString(9, operatingTime);
				pstmt.setInt(10, usageFeeMin);
				pstmt.setInt(11, usageFeeMax);
				pstmt.setInt(12, regFee);
				pstmt.setString(13, openDate);
				pstmt.setString(14, thumbnail);
				pstmt.setString(15, image);
				pstmt.setString(16, detail);
				pstmt.setString(17, sportsName);
				return pstmt;
			}
		});
	}
	
	public void centerModify(final String centerName, final String detail, final String sportsName, 
			final String telNumber, final String address, final String zipCode, final float latitude, final float longitude, 
			final String thumbnail, final String image, final int usageFeeMin, final int usageFeeMax, 
			final int regFee, final String openDate, final String dayoff, final String operatingTime, final String centerCode) {
		this.template.update(new PreparedStatementCreator() {
			
			
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				String updatethumbnail = "";
				String updateimage = "";
				System.out.println("thumnail : "+thumbnail);
				if(!thumbnail.equals("")&&!image.equals(""))
				{
					updatethumbnail = ", c.thumbnail = ? ";
					updateimage = ", c.image = ? ";						
				}
				else if(!thumbnail.equals("")&&image.equals(""))
				{
					updatethumbnail = ", c.thumbnail = ? ";
				}
				else if(thumbnail.equals("")&&!image.equals(""))
				{
					updateimage = ", c.image = ? ";		
				}
				String query = "update center c "
						+ "set c.center_name = ?, c.detail = ?, "
						+ "c.sports_code = (select s.sports_code from sports s where s.sports_name = '"+ sportsName + "' and c.center_code = '" + centerCode + "'), "
						+ "c.tel_number = ?, c.address = ?, c.zipcode = ?, c.latitude = ?, c.longitude = ?, "
						+ "c.usage_fee_min = ?, c.usage_fee_max = ?, c.regfee = ?, c.open_date = ?, c.dayoff = ?, c.operating_time = ? " + updatethumbnail + updateimage 
						+ "where exists (select 1 from sports s where s.sports_name = '"+ sportsName + "' and c.center_code = '" + centerCode + "')";
				System.out.println(sportsName);
				System.out.println(centerCode);
				System.out.println(query);
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, centerName);
				pstmt.setString(2, detail);
				pstmt.setString(3, telNumber);
				pstmt.setString(4, address);
				pstmt.setString(5, zipCode);
				pstmt.setFloat(6, latitude);
				pstmt.setFloat(7, longitude);				
				pstmt.setInt(8, usageFeeMin);
				pstmt.setInt(9, usageFeeMax);
				pstmt.setInt(10, regFee);
				pstmt.setString(11, openDate);
				pstmt.setString(12, dayoff);
				pstmt.setString(13, operatingTime);
				if(!thumbnail.equals("")&&!image.equals(""))
				{
					pstmt.setString(14, thumbnail);
					pstmt.setString(15, image);
				}
				else if(!thumbnail.equals("")&&image.equals(""))
				{
					pstmt.setString(14, thumbnail);
				}
				else if(thumbnail.equals("")&&!image.equals(""))
				{
					pstmt.setString(14, image);
				}
				return pstmt;
			}
		});
	}
	

	public void centerDelete(final String centerCode) {
		// TODO Auto-generated method stub
		String query = "delete from center where center_code = ?";
		System.out.println("cetnerDelete에서의 centerCode : "+centerCode);
		this.template.update(query, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, centerCode);
			}
		});
		
	}
}
