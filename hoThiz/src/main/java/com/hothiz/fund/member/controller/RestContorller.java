package com.hothiz.fund.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hothiz.fund.member.dto.Member_paymentDTO;
import com.hothiz.fund.member.service.MemberService;

@RestController
public class RestContorller {

	@Autowired
	MemberService ms;
	
	@GetMapping(value="rest/{val}/{col}", produces="application/text;charset=utf-8")
	public String get(@PathVariable String val,@PathVariable String col, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sVal = val;
		String sCol = col;
		String msg = "변경이 완료되었습니다";
		String id = (String)session.getAttribute("userId");
		System.out.println(sVal + " 와 " + sCol + " 와 " + id);
		
		try {
		ms.updateSetting(sVal,sCol,id);
		}catch (Exception e) {
			msg = "중복된값이 존재합니다";
		}
		
		return msg;
		
		}
	
	@GetMapping(value="chpw/{cuPwd}/{chPwd}/{chkPwd}/{chCol}", produces="application/text;charset=utf-8")
	public String chpwCon(@PathVariable String cuPwd, @PathVariable String chPwd,
			@PathVariable String chkPwd, @PathVariable String chCol, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		System.out.println(cuPwd);
		System.out.println(chPwd);
		System.out.println(chkPwd);
		System.out.println(chCol);
		//System.out.println(ms.pwdCheck(cuPwd, id));
		if(ms.pwdCheck(cuPwd, id) == 0) {
			return "현재 비밀번호가 일치하지않습니다.";
		}else if(!chPwd.equals(chkPwd)) {
			return "비밀번호 확인을 동일하게 입력해주세요.";
		}else if(cuPwd.equals(chPwd)) {
			return "동일한 비밀번호 입니다.";
		}else if(chPwd.length() < 10 || chPwd.length() >30 ) {
			return "비밀번호는 최소 10글자이상 30글자이하로 입력해주세요";
		}else {
			ms.pwdChange(chPwd, id);
			return "비밀번호 변경 완료!";
		}	
	}
	
	@GetMapping(value="alarm_agree_setting/{agree_sign}")
	public String alarm_agree_setting(@PathVariable String agree_sign, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		int agree = Integer.parseInt(agree_sign);
		System.out.println("어그리 : " + agree);
		// 동의 /비동의 여부
		if(agree == 0) {
			System.out.println("비동의상태");
			ms.setAlarmAgree(1,id);
		}else {
			System.out.println("동의상태");
			ms.setAlarmAgree(0,id);
		}
	
		return "dd";
	}
	
	@PostMapping(value="paid/{pid}/{email}/{imp_uid}/{merchant_uid}/{paid_amount}/{apply_num}")
	public String paid(@PathVariable int pid,  @PathVariable String email,
			@PathVariable String imp_uid, @PathVariable String merchant_uid, @PathVariable int paid_amount,
			@PathVariable String apply_num) throws UnsupportedEncodingException {
			Member_paymentDTO dto = new Member_paymentDTO();
			//String ptitle2 = URLDecoder.decode(ptitle, "UTF-8");
			
			
			dto.setProject_id(pid);
			//dto.setProject_title(ptitle2);
			dto.setMember_email(email);
			dto.setImp_uid(imp_uid);
			dto.setMerchant_uid(merchant_uid);
			dto.setPaid_amount(paid_amount);
			dto.setApply_num(apply_num);
			
			ms.paymethod(dto);
			
		
		return "dd";
	}
	
	
	
	
}//dd
