package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team1.domain.board.HelpVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.HelpService;
import com.team1.service.user.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/help")

public class HelpController {
	
	@Setter(onMethod_ = @Autowired)
	private HelpService service;
	
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	
	@GetMapping("/list")
	public void list(Model model, HttpSession session) {
		String id = "EasyMoneySniper";
		List<HelpVO> list = service.getList();
		UserVO loggedmember = userService.read(id);
		session.setAttribute("loggedInMember", loggedmember);
		model.addAttribute("list", list);
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("id") Integer id, Model model, HttpSession session) {
		HelpVO board = service.get(id);
		String nickname = service.getNick(id);
		String nick = "EasyMoneySniper";
		UserVO loggedmember = userService.read(nick);
		System.out.println("get, modify board : "+board);
		System.out.println("get, modify : "+loggedmember);
		session.setAttribute("loggedInMember", loggedmember);
		model.addAttribute("board", board);
		model.addAttribute("nickname", nickname);
	}
	
	@PostMapping("/modify")
	public String modify(HelpVO board, RedirectAttributes rttr) {
		System.out.println("/modify로 잘 옴.");
		System.out.println(board);
		if (service.modify(board)) {
			System.out.println("수정됨");
			rttr.addFlashAttribute("result", board.getId() + "번 게시글이 수정되었습니다.");
		}
		return "redirect:/help/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(HelpVO board, RedirectAttributes rttr, HttpServletRequest req) {

		service.register(board);

		rttr.addFlashAttribute("result", board.getId() + "번 게시글이 등록되었습니다.");

		return "redirect:/help/list";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("ID") Integer id, RedirectAttributes rttr) {
	
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", id + "번 게시글이 삭제되었습니다.");
		}
		
		return "redirect:/help/list";
	}
	
	
}
