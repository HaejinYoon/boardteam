package com.team1.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.domain.board.PReplyVO;
import com.team1.service.board.PReplyService;

import lombok.Setter;

@Controller
@RequestMapping("/preply")
public class PReplyController {
	
	@Setter(onMethod_=@Autowired)
	private PReplyService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		List<PReplyVO> list = service.getList();
		
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	

}
