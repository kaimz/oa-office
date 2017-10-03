package cn.qnight.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/test")
public class TestController extends BaseController {

	@RequestMapping("/index")
	public String index() {
		return "test/test_index";
	}

	/**
	 * @Title: upload
	 * @Description: TODO(读取txt文件)
	 * @param @param
	 *            file 前台文件
	 * @return List<List<String>> 返回类型
	 * @throws IOException
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public List<List<String>> upload(@RequestParam(value ="file", required = false) MultipartFile file) throws IOException {
		InputStreamReader read = new InputStreamReader(file.getInputStream(), "utf-8");
		BufferedReader bufferedReader = new BufferedReader(read);
		String lineTxt = null;// 按行读取txt
		Boolean flag = false; // 设置当读取到地块坐标属性
		Boolean _flag = false;// 设置当读取到地块坐标中的@
		List<List<String>> list = new ArrayList<List<String>>();
		
		while ((lineTxt = bufferedReader.readLine()) != null) {
			if (_flag == true) {
				String[] coor = lineTxt.split(",");
				List<String> listIndex = new ArrayList<>();
				for (int i = 2; i < coor.length; i++) {
					listIndex.add(coor[i]);
				}
				list.add(listIndex);
			}

			if (flag == true && lineTxt.contains("@")) {
				_flag = true;
			}
			if (lineTxt.contains("地块坐标")) {
				flag = true;
			}

		}
		bufferedReader.close();
		read.close();
		return list;
	}
	
	@RequestMapping("/upload1")
	@ResponseBody
	public Boolean upload1() {
		System.out.println("进入");
		return true;
	}
}
