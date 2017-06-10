package com.angularjstest.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.angularjstest.dto.DeveloperDTO;

@Controller
public class AjaxController {
	@RequestMapping(value = "/angularajax", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> getDevelopersList(@RequestBody Map<String, Object> info) {	
		Map<String, Object> response = new HashMap<String, Object>(); //諛섑솚�븷 ���엯�쓽 �겢�옒�뒪瑜� �꽑�뼵//
		
		System.out.println("$http call(post): " + info.get("page").toString());
		
		//데이터 초기화(DAO)//
		List<DeveloperDTO>developerlist = new ArrayList<DeveloperDTO>();
		
		//개발자 정보설정//
		DeveloperDTO developer1 = new DeveloperDTO();
		developer1.setAge("20");
		developer1.setName("서창욱");
		developer1.setPhoto("question.png");
		
		developerlist.add(developer1);
		
		DeveloperDTO developer2 = new DeveloperDTO();
		developer2.setAge("10");
		developer2.setName("홍길동");
		developer2.setPhoto("information.png");
		
		developerlist.add(developer2);
		
		DeveloperDTO developer3 = new DeveloperDTO();
		developer3.setAge("25");
		developer3.setName("임꺽정");
		developer3.setPhoto("error.png");
		
		developerlist.add(developer3);
		
		response.put("result", "success");
		response.put("value", developerlist);
		
		return response;
	}
	
	@RequestMapping(value = "/angularajaxget/{page}/{number}", method = RequestMethod.GET)
	public Map<String, Object> getDevelopersListget(@PathVariable String page, @PathVariable String number) {
		Map<String, Object> response = new HashMap<String, Object>(); //諛섑솚�븷 ���엯�쓽 �겢�옒�뒪瑜� �꽑�뼵//
		
		System.out.println("$http call(get): " + page + "/" + number);
		
		//데이터 초기화(DAO)//
		List<DeveloperDTO>developerlist = new ArrayList<DeveloperDTO>();
		
		//개발자 정보설정//
		DeveloperDTO developer1 = new DeveloperDTO();
		developer1.setAge("20");
		developer1.setName("잭");
		developer1.setPhoto("people.PNG");
		
		developerlist.add(developer1);
		
		DeveloperDTO developer2 = new DeveloperDTO();
		developer2.setAge("10");
		developer2.setName("스미스");
		developer2.setPhoto("information.png");
		
		developerlist.add(developer2);
		
		DeveloperDTO developer3 = new DeveloperDTO();
		developer3.setAge("25");
		developer3.setName("존");
		developer3.setPhoto("error.png");
		
		developerlist.add(developer3);
		
		response.put("result", "success");
		response.put("value", developerlist);
		
		return response;
	}
	
	@RequestMapping(value = "/enrollajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> enrollStudent(MultipartHttpServletRequest multi) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("------------------<<File Upload>>---------------------");

		// 저장 경로 설정
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/";

		File dir = new File(path);

		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		// 전송된 파일들(getFileNames)을 불러오기 위한 반복자(Formdata 탐색)//
		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String uploadFile = files.next();
           
		    MultipartFile mFile = multi.getFile(uploadFile);
		    
		    String fileName_original = mFile.getOriginalFilename();
		    //현재 프로젝트(서버)의 resources 경로//
		    String file_save_path = "/Users/macbook/git/AngularJSTest/AngularJSTest/src/main/webapp/resources/upload/";
		             
		    try {
		    	mFile.transferTo(new File(file_save_path+fileName_original));
		    	
		    	System.out.println("전송된 파일 이름 : " +fileName_original);
			    //System.out.println("파일 이름: " + newFileName);
			    System.out.println("파일 사이즈: " + mFile.getSize());
				
				System.out.println("------------------------------------------------------");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 파일 이외의 text데이터//
		System.out.println("email: " + multi.getParameter("email"));
		
		//사용자 디비정보를 참조할 수 있다.//
		retVal.put("retVal", "trans success...");
		
		return retVal;
	}
}
