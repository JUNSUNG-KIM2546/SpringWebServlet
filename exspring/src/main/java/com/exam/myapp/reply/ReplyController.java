package com.exam.myapp.reply;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.exam.myapp.member.MemberVo;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;	// 스프링은 기본적으로 싱글톤패턴
	
	@PostMapping("add.do")
	@ResponseBody	// 메서드의 번환값을 응답
	public String add(ReplyVo rvo, HttpSession session, @SessionAttribute("loginUser") MemberVo mvo) {
		
		//MemberVo mvo = (MemberVo) session.getAttribute("loginUser");
		
		rvo.setRepWriter( mvo.getMemId() );
		int num = replyService.insertReply(rvo);
		
		//return "redirect:/bbs/edit.do?bbsNo=" + rvo.getRepBbsNo();
		return num + "개의 갯글 저장";	// ""
	}

}
