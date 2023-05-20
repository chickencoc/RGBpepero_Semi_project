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
import com.example.mini.mapper.BoardMapper;
import com.example.mini.model.Board;
import com.example.mini.model.BrdReply;
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

	@RequestMapping("/board/fileupload.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String orgName = multi.getOriginalFilename();
            String imgType = orgName.substring(orgName.lastIndexOf("."),orgName.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(imgType);           
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("orgName : " + orgName);
            System.out.println("extensionName : " + imgType);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path2 + "\\src\\main\\webapp\\image\\board");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\image\\board", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\img\\" + saveFileName);
                map.put("boardNo", boardNo);
//                map.put("replyNo", replyNo);
                map.put("imgSrc", "/image/board/"+saveFileName);
                map.put("imgName", saveFileName);
                map.put("orgName", orgName);
                map.put("imgType", imgType);
                
                // insert 쿼리 실행
                boardService.addBoardImg(map); 
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:boardMain.do";
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
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
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
//    게시판 글 읽을때 이미지 리스트 읽기
    @RequestMapping(value = "/board/readImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBoardImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBrdImgList(map);
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
	public String insertBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		map.put("userId", session.getAttribute("sessionId"));
		boardService.addBoard(map);
		resultMap.put("result", "success");
		resultMap.put("boardNo", map.get("id"));
		return new Gson().toJson(resultMap);
	}
  @RequestMapping(value = "/board/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.delBoard(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
  }
  @RequestMapping(value = "/board/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.editBoard(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
}
  
//  댓글 가져오기
  
  @RequestMapping(value = "board/readReply.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBrdReply(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		BrdReply reply = boardService.searchBrdReply(map);
		resultMap.put("reply", reply);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
  
  @RequestMapping(value = "board/addReply.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addBrdReply(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.addBrdReply(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
  @RequestMapping(value = "/board/editReply.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editReply(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.editBrdReply(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
}
  
  
  @RequestMapping(value = "/board/deleteReply.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delReply(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.delBrdReply(map);
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
    @RequestMapping("/boardEdit.do") 
    public String board4(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
		return "/board/board4";
	}

}
