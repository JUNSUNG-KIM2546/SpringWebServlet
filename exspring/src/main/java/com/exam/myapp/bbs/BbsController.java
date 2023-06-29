package com.exam.myapp.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.exam.myapp.member.MemberVo;

// 알트 + 쉬프트 + R : 한번에 바꾸기
// 컨트롤 + 쉬프트 + Y : 소문자로 바구기 
// 컨트롤 + 쉬프트 + X : 대문자로 바구기 

@Controller
@RequestMapping("/bbs/")	//현재 컨트롤러 클래스 내부의 모든 메서드들의 공통 경로 설정
public class BbsController {
	@Autowired
	private BbsService bbsService;	// 스프링은 기본적으로 싱글톤패턴
	
	//스프링 방식//
	//게시판리스트
	@GetMapping("list.do")	//@RequestMapping(path = "list.do", method = RequestMethod.GET)
	public String list(Model model) {	
		
		List<BbsVo> List = bbsService.selectBbsList();	
		
		model.addAttribute("bbsList", List);
		
		return "bbs/bbsList";
	}
	
	//게시판 글쓰기
	@GetMapping("add.do")	//@RequestMapping(path = "add.do", method = RequestMethod.GET)
	public String addform() {
		return "bbs/bbsAdd";	// 실행될 JSP
	}
	@PostMapping("add.do")	//@RequestMapping(path = "add.do", method = RequestMethod.POST)
	public String add(BbsVo vo, HttpSession session, @SessionAttribute("loginUser") MemberVo mvo) {
		
		//MemberVo mvo = (MemberVo) session.getAttribute("loginUser"); //세션에 로그인 저장
		vo.setBbsWriter(mvo.getMemId());	//로그인한 사용자아이디를 게시글 작성자로 설정
		
		
		int n = bbsService.insertBbs(vo);	//클래스 참조하라

		System.out.println(n + "개의 게시글 등록");
		
		return "redirect:/bbs/list.do";			
	}
	
	//게시글 수정
	@GetMapping("edit.do")	//@RequestMapping(path = "edit.do", method = RequestMethod.GET)
	public String editform(Model model, int bbsNo) {
		
		BbsVo vo = bbsService.selectBbs(bbsNo);
		model.addAttribute("bvo", vo);
		
		return "bbs/bbsEdit";
	}
	@PostMapping("edit.do")	//@RequestMapping(path = "edit.do", method = RequestMethod.POST)
	public String edit(BbsVo vo) {
//		req.setCharacterEncoding("UTF-8");	//필터로 이동
		
		int n = bbsService.updateBbs(vo);	//클래스 참조하라
		System.out.println(n + "개의 게시글 수정");

		// 수정 후 목록창으로 이동
		return "redirect:/bbs/list.do";
	}
	
	//게시글 삭제
	@GetMapping("del.do")	//@RequestMapping(path = "del.do", method = RequestMethod.GET)
	public String del(int bbsNo) {
//		req.setCharacterEncoding("UTF-8");
		
		int n = bbsService.deleteBbs(bbsNo);	//클래스 참조하라
		System.out.println( n + "개의 게시글 삭제");
		
		// 삭제 후 바로 리스트 창으로 가라
		return "redirect:/bbs/list.do";	
	}
	
}

