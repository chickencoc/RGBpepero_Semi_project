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

import com.example.mini.dao.ProdSubService;
import com.example.mini.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class WeddingRecommendController {
	@Autowired
	private ProdSubService prodSubService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/prod5Sub0.do") 
    public String mainPage(Model model) throws Exception{
		
        return "/prod5_sub0";
    }
	
	@RequestMapping(value = "/prodSubWedding.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchWeddingList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = prodSubService.searchWeddingList(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/weddingRecommend.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchWeddingRList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = prodSubService.serachWeddingRList(map);
		resultMap.put("message", "성공");
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/prod6Sub0.do") 
    public String tripPage(Model model) throws Exception{
		
        return "/prod6_sub0";
    }
	
	@RequestMapping(value = "/tripRecommend.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchtripList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = prodSubService.searchTripList(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/prod5Sub1.do") 
    public String weddingEditPage(Model model) throws Exception{
		
        return "/prod5_sub1";
    }
	
	@RequestMapping(value = "/addWedding.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addWedding(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		prodSubService.addWedding(map);
		resultMap.put("result", "success");
		resultMap.put("weddingNo", map.get("id"));
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/weddingImgupload.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("weddingNo") String weddingNo, HttpServletRequest request,HttpServletResponse response, Model model)
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
            System.out.println("Working Directory = " + path2 + "\\src\\main\\webapp\\image");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\image", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\img\\" + saveFileName);
                map.put("weddingNo", weddingNo);
//                map.put("replyNo", replyNo);
                map.put("imgSrc", "/image/"+saveFileName);
                map.put("imgName", saveFileName);
                map.put("orgName", orgName);
                map.put("imgType", imgType);
                
                // insert 쿼리 실행
                prodSubService.addImg(map); 
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:main.do";
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
    //
    @RequestMapping(value = "/removeWedding.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeWedding(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		prodSubService.removeWeddding(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
    @RequestMapping("/prod5Sub2.do") 
    public String weddingModify(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/prod5_sub2";
    }
	
	@RequestMapping(value = "weddingEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String weddingEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		prodSubService.editWedding(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/weddingView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String weddingView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = prodSubService.searchWeddingInfo(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/prod6Sub1.do") 
    public String tripDetailPage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/prod6_sub1";
    }
	
	@RequestMapping(value = "/tripView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tirpView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = prodSubService.searchTripInfo(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/tripImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tripImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = prodSubService.searchTripImgList(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/addTrip.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addTrip(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		prodSubService.addTrip(map);
		resultMap.put("result", "success");
		resultMap.put("tirpNo", map.get("id"));
		return new Gson().toJson(resultMap);
	}
	@RequestMapping("/tripImgupload.dox")
    public String TripImg(@RequestParam("file1") MultipartFile multi, @RequestParam("tripNo") String tripNo, HttpServletRequest request,HttpServletResponse response, Model model)
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
            System.out.println("Working Directory = " + path2 + "\\src\\main\\webapp\\image\\tripO");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\image\\tripO", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\img\\tripO" + saveFileName);
                map.put("tripNo", tripNo);
//                map.put("replyNo", replyNo);
                map.put("imgSrc", "/image/tripO"+saveFileName);
                map.put("imgName", saveFileName);
                map.put("orgName", orgName);
                map.put("imgType", imgType);
                
                // insert 쿼리 실행
                prodSubService.addTripImg(map); 
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:main.do";
    }
	
	@RequestMapping("/tripImguploadList.dox")
    public String TripImgList(@RequestParam("file1") MultipartFile multi, @RequestParam("tripNo") String tripNo, HttpServletRequest request,HttpServletResponse response, Model model)
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
            System.out.println("Working Directory = " + path2 + "\\src\\main\\webapp\\image\\tripO");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\image\\tripO", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\img\\tripO" + saveFileName);
                map.put("tripNo", tripNo);
//                map.put("replyNo", replyNo);
                map.put("imgSrc", "/image/tripO"+saveFileName);
                map.put("imgName", saveFileName);
                map.put("orgName", orgName);
                map.put("imgType", imgType);
                
                // insert 쿼리 실행
                prodSubService.addTripImgList(map); 
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:main.do";
    }
	
	@RequestMapping("/prod6Sub2.do") 
    public String tripEditPage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/prod6_sub2";
    }
	
	
	@RequestMapping(value = "tripEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tripEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		prodSubService.editTrip(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
}
