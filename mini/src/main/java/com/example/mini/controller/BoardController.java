package com.example.mini.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.mini.dao.BoardService;
import com.example.mini.model.Board;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/boardTest.do") 
    public String boardeditor(Model model) throws Exception{
		return "/board/editor";
	}

	@RequestMapping("/upload.do")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardIdx") int boardIdx, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
  
            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path2 + "src\\webapp\\img");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\img\\" + saveFileName);
                map.put("boardIdx", boardIdx);
                
                // insert 쿼리 실행
                //	        		insertBoardImg(map); 
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:board.do";
    }
    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
    
//    메인
    @RequestMapping("/boardMain.do") 
    public String boardMain(Model model) throws Exception{
		return "/board/board0";
	}
//    공지사항 페이지
    @RequestMapping("/notice.do") 
    public String boardNotice(Model model) throws Exception{
		return "/board/board10";
	}

//  문의사항 게시판
	  @RequestMapping("/inquery.do") 
	  public String boardInquery(Model model) throws Exception{
			return "/board/board20";
		}

//    게시판 목록 띄우기
    @RequestMapping(value = "/board/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardList(map);
		return new Gson().toJson(resultMap);
	}

//  게시판 글 하나 읽기 맵핑
  @RequestMapping("/readBoard.do") 
  public String boardRead(HttpServletRequest request, Model model,@RequestParam HashMap<String, Object> map) throws Exception{
  	request.setAttribute("map", map);
		return "/board/board2";
	}
  
//    게시판 글 하나 읽기 기능
    @RequestMapping(value = "/board/read.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Board info = boardService.searchBoard(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
    //작성 페이지
    @RequestMapping("/board3.do") 
    public String board3(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
    	return "/board/board3";
	}
  @RequestMapping(value = "/board/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertBbs(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		map.put("userId", session.getAttribute("sessionId"));
		boardService.addBoard(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
    
    @RequestMapping("/boardTable.do") 
    public String boardTable(Model model) throws Exception{
		return "/board/boardTable";
	}
    
    @RequestMapping("/board30.do") 
    public String board30(Model model) throws Exception{
		return "/board/board30";
	}
    @RequestMapping("/board4.do") 
    public String board4(Model model) throws Exception{
		return "/board/board4";
	}

}
