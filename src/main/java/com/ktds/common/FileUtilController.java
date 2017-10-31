package com.ktds.common;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileUtilController {
	
	public static final String PATH = "D://uploadFiles";
	
	@RequestMapping("/common/download/{fileName}")
	public void download(@PathVariable String fileName, HttpServletRequest request, HttpServletResponse response) {
		
		String changeFileName = fileName.replaceAll("\\-", "\\.");
		
		DownloadUtil downloadUtil = new DownloadUtil( PATH + File.separator + changeFileName );
		
		try {
			downloadUtil.download(request, response, changeFileName );
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
