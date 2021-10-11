package org.zerock.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.Coolsms;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class SendSms {

	
	@GetMapping("/sendSms")
	public void sendSms()
	{
		
	}
	
	
	@PostMapping("/sendSms")
	  public String sendSms(HttpServletRequest request) throws Exception {

	    String api_key = "NCSRRBANGK3PA7JB";
	    String api_secret = "UAXC68Y79HVTNQUPS0UHS8LL0WURCMHN";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", "01055649947"); // 수신번호

	    set.put("from", (String)request.getParameter("from")); // 발신번호
	    set.put("text", (String)request.getParameter("text")); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);

	    JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }
	    	return "/index";
	    
	  }
}
