//package com.kh.oherp.controller;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.kh.oherp.entity.BoardDto;
//
//
//@Controller
//@RequestMapping("/board")
//public class Board1Controller {
//	
//	@Autowired
//	private SqlSession sqlSession;
//	
////	@Autowired
////	private BoardDao boardDao;
//
//	@GetMapping("/board1")
//	public String list(Model model) {
////		List<BoardDto> list = sqlSession.selectList("board.getList");
////		model.addAttribute("board1", board);
//		
////		return "/WEB-INF/views/board/list.jsp";
//		return "board/board1";
//	}
//	
//	@PostMapping("/search")
//	public String search(
//				@RequestParam String type,
//				@RequestParam String keyword,
//				Model model
//			) {
//		
//		Map<String, String> param = new HashMap<>();
//		param.put("type", type);
//		param.put("keyword", keyword);
//		List<BoardDto> list = sqlSession.selectList("board.search", param);
//		model.addAttribute("list", list);
//		
//		return "board/list";
//	}
//	
//	@RequestMapping("/union")
//	public String union(
//				@RequestParam(required = false) String type,
//				@RequestParam(required = false) String keyword,
//				Model model
//			) {
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("type", type);
//		map.put("keyword", keyword);
//		
//		List<BoardDto> list = sqlSession.selectList("board.unionList", map);
//		model.addAttribute("list", list);
//		
//		return "board/list";
//	}
//	
//	//글 쓰기
//	@GetMapping("/write")
//	public String write() {
////		return "/WEB-INF/views/board/write.jsp";
//		return "board/write";
//	}
////	@PostMapping("/write")
////	public String write(
////			@ModelAttribute BoardDto boardDto,
////			//이 도구는 redirect 시 파라미터를 첨부하는 역할을 한다
////			RedirectAttributes attr) {
////		
////		int no = boardDao.write(boardDto);
////		
////	return "redirect:content?board_no="+no;//직접 작성
////		
////		attr.addAttribute("board_no", no);
////		return "redirect:content";
////	}
//	
//	@GetMapping("/board1")
//	public String board1(
////			@RequestParam int board_no,
////			Model model) {
////		BoardDto boardDto = boardDao.read(board_no);
////		model.addAttribute("boardDto", boardDto);
//		
////		return "/WEB-INF/views/board/content.jsp";
//		return "board/board1";
//	}
//	
//}