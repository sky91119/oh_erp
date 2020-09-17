package com.kh.oherp.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@GetMapping("/list2")
	public String list2(Model model) {
		List<BoardDto> list = sqlSession.selectList("board.getList");
		model.addAttribute("list", list);
		return "board/list2";
	
	}
	@GetMapping("/list3")
	public String list3(Model model) {
		List<BoardDto> list = sqlSession.selectList("board.getList");
		model.addAttribute("list", list);
		return "board/list3";
	
	}
	@GetMapping("/list4")
	public String list4(Model model) {
		List<BoardDto> list = sqlSession.selectList("board.getList");
		model.addAttribute("list", list);
		return "board/list4";
	
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
		return "redirect:list";
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
	
	@GetMapping("/delete/{board_no}")
	public String delete(@PathVariable int board_no) {
		boardDao.delete(board_no);
	   return "board/delete";
	}

//	방식2 : Spring에서 권장하는 방식(DispatcherServlet 이용)
//	- ResponseEntity : 응답 정보가 모여있는 개체 파일다운
	@GetMapping("/down/{no}")
	public ResponseEntity<ByteArrayResource> down(
				@PathVariable int no) throws IOException{
		BoardDto gallaryDto = boardDao.get(no);
		if(gallaryDto == null) {//정보가 없을 때
			return ResponseEntity.notFound().build();
		}
		else {//정보가 있을 때
			File target = new File("D:/upload", String.valueOf(no));
			byte[] data = FileUtils.readFileToByteArray(target);
			ByteArrayResource res = new ByteArrayResource(data);
			
			return ResponseEntity
							.ok()
							.contentType(MediaType.APPLICATION_OCTET_STREAM)
							.contentLength(gallaryDto.getFsize())
							.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+URLEncoder.encode(gallaryDto.getFname(), "UTF-8")+"\"")
							.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
						.body(res);
	
		}

//		// 게시판 수정뷰
//		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
//		public String updateView(BoardDto boardDto, Model model) throws Exception{
//			logger.info("updateView");
//			
//			model.addAttribute("update", service.read(boardVO.getBno()));
//			
//			return "board/updateView";
//		}
//		
//		// 게시판 수정
//		@RequestMapping(value = "/update", method = RequestMethod.POST)
//		public String update(BoardDto boardDto) throws Exception{
//			logger.info("update");
//			
//			service.update(boardVO);
//			
//			return "redirect:/board/list";
//		}
		
		
		}
}