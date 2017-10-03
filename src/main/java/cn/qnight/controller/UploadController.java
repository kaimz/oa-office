package cn.qnight.controller;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.qnight.common.FastDFSUtils;
import cn.qnight.common.PropertyUtil;
import cn.qnight.common.UploadFileVo;

/**
 * 上传图片
 * @author yong.cao
 * @time 2017年6月12日下午9:49:06
 */
@Controller
public class UploadController {
	/**
	 * 上传图片
	 * @param pic
	 */
	@RequestMapping(value=("/upload/uploadPic"))
	public String uploadPic(@RequestParam(required=false) MultipartFile pic, 
			HttpServletResponse response){
		//log.info("uploadPic start. fliename={}",null!=pic ? pic.getOriginalFilename():"");
		try {
			//上传图片
			UploadFileVo vo = new UploadFileVo();
			vo.setPic(pic.getBytes());
			vo.setName(pic.getOriginalFilename());
			vo.setSize(pic.getSize());
			String path = FastDFSUtils.uploadPic(vo);
			System.out.println(vo.getName() + "   的地址是:   " + path);
			//图片url
			//String url = Constants.IMG_URL + path;
			//回写图片
			/*JSONObject jsonObj = new JSONObject();
			if(StringUtils.isNotBlank(path)){
				jsonObj.put("url", url);
				jsonObj.put("isSuccess", true);
			}else{
				jsonObj.put("isSuccess", false);
				jsonObj.put("errorMsg", "上传图片失败!");
			}
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().write(jsonObj.toString());*/
			System.out.println("redirect:" + PropertyUtil.get("fast_server") + path);
			return "redirect:" + PropertyUtil.get("fast_server") + path;
		} catch (IOException e) {
			//log.error("uploadPic io error:{}",e.getMessage(),e);
		} catch (Exception e) {
			//log.error("uploadPic error:{}",e.getMessage(),e);
		}
		//log.info("uploadPic end.");
		return "";
	}
}
