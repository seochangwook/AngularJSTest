package com.angularjstest.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
}
