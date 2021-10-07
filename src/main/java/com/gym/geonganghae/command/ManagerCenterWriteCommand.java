package com.gym.geonganghae.command;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gym.geonganghae.dao.ManagerCenterDAO;


public class ManagerCenterWriteCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MultipartFile thumnail_file = request.getFile("thumbnail");
		MultipartFile image_file = request.getFile("image");
		
		String path = "C:\\image\\";
		String centerCode = request.getParameter("centerCode");
		String thumbnail = thumnail_file.getOriginalFilename(); // 원본 파일 명
		long thumbnail_Size = thumnail_file.getSize(); // 파일 사이즈

		String save_thumnail_name = path + centerCode + "_" + thumbnail;

		try {
			thumnail_file.transferTo(new File(save_thumnail_name));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String image = image_file.getOriginalFilename(); // 원본 파일 명
		long image_Size = image_file.getSize(); // 파일 사이즈

		String save_image_name = path + centerCode + "_" + image;

		try {
			image_file.transferTo(new File(save_image_name));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String centerName = request.getParameter("centerName");
		String sportsName = request.getParameter("sportsName");
		String telNumber = request.getParameter("telNumber");
		String zipCode = request.getParameter("zipCode");
		String address = request.getParameter("address");
		String latitude_float = request.getParameter("latitude");
		String longitude_float = request.getParameter("longitude");
		float latitude = Float.parseFloat(latitude_float);
		float longitude = Float.parseFloat(longitude_float);
		String dayoff = request.getParameter("dayoff");
		String operatingTime = request.getParameter("operatingTime"); 
		String usageFeeMin_int = request.getParameter("usageFeeMin");
		String usageFeeMax_int = request.getParameter("usageFeeMax");
		String regFee_int = request.getParameter("regFee");
		int usageFeeMin = Integer.parseInt(usageFeeMin_int);
		int usageFeeMax = Integer.parseInt(usageFeeMax_int);
		int regFee = Integer.parseInt(regFee_int);
		String openDate = request.getParameter("openDate");
		//String thumbnail = request.getParameter("thumbnail");
		String detail = request.getParameter("detail");
	
		
		ManagerCenterDAO dao = new ManagerCenterDAO();
		dao.centerWrite(centerCode, centerName, telNumber, zipCode, address, latitude, longitude, dayoff, operatingTime,
				usageFeeMin, usageFeeMax, regFee, openDate, thumbnail, image, detail, sportsName);
	}
}
