package com.kh.oherp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.oherp.entity.BoardDto;
import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.repository.BoardDao;
import com.kh.oherp.repository.DepartmentDao;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardDao boardDao;

	@GetMapping("/list")
	public String list(Model model) {
		List<BoardDto> list = sqlSession.selectList("board.getList");
		model.addAttribute("list", list);
		return "board/list";
	}
	
	@PostMapping("/search")
	public String search(
				@RequestParam String type,
				@RequestParam String keyword,
				Model model
			) {
		
		Map<String, String> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		List<BoardDto> list = sqlSession.selectList("board.search", param);
		model.addAttribute("list", list);
		
		return "board/list";
	}
	
	@RequestMapping("/union")
	public String union(
				@RequestParam(required = false) String type,
				@RequestParam(required = false) String keyword,
				Model model
			) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		List<BoardDto> list = sqlSession.selectList("board.unionList", map);
		model.addAttribute("list", list);
		
		return "board/list";
	}
	
	//글 쓰기
	@GetMapping("/write")
	public String write() {
//		return "/WEB-INF/views/board/write.jsp";
		return "board/write";
	}
	@PostMapping("/write")
	public String write(
			@ModelAttribute BoardDto boardDto,
			//이 도구는 redirect 시 파라미터를 첨부하는 역할을 한다
			RedirectAttributes attr) {
		//boardDto에는 정보가 3개 들어있다
		//- 회원번호는 여기서밖에 알 수 없으니까 구해와서 설정해준다.
	    //	boardDto.setMember_code(1);
		
		int no = boardDao.write(boardDto);
		
		attr.addAttribute("board_no", no);
		return "redirect:content";
	}
	
	@GetMapping("/content")
	public String content(
			@RequestParam int board_no,
			Model model) {
//		BoardDto boardDto = boardDao.get(board_no); 단위작업
		BoardDto boardDto = boardDao.read(board_no);  //read로 해야 조회수 증가됨 
		model.addAttribute("boardDto", boardDto);
		
		return "board/content";
	}
	

	    }

