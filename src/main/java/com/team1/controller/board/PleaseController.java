package com.team1.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.domain.board.PleaseVO;
import com.team1.service.board.PleaseService;

import lombok.Setter;

@Controller
@RequestMapping("/please")
public class PleaseController {
	
	@Setter(onMethod_ = @Autowired)
	private PleaseService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		List<PleaseVO> list = service.getList();
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("id") Integer id, Model model) {
		PleaseVO board = service.get(id);
		
		model.addAttribute("board", board);
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	
	
	
	
}
