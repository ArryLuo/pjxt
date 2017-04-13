package com.populook.util;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import net.sf.json.JSONObject;

public class InitePathListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	//更新ueditor路径配置文件
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		String path = this.getClass().getClassLoader().getResource("/").getPath();
		path = path.substring(0,path.indexOf("WEB-INF")) + "js/common/ueditor/jsp/config.json";
		File file=new File(path);
		StringBuilder builder = new StringBuilder();
	    try{
		    InputStreamReader reader = new InputStreamReader(new FileInputStream(file), "UTF-8");
		    BufferedReader bfReader = new BufferedReader(reader);
		    String tmpContent = null;
		    while ((tmpContent = bfReader.readLine()) != null) {
		        builder.append(tmpContent);
		    }
		    bfReader.close();
	    }
	    catch (UnsupportedEncodingException e){
	    	e.printStackTrace();
	    }
	    catch (IOException e) {
	    	e.printStackTrace();
		}

	    JSONObject jsonObject=JSONObject.fromObject(filter(builder.toString()));
	    jsonObject.put("imageUrlPrefix", SysConfig.UEDITOR_PATH);
	    jsonObject.put("scrawlUrlPrefix", SysConfig.UEDITOR_PATH);
	    jsonObject.put("snapscreenUrlPrefix", SysConfig.UEDITOR_PATH);
	    jsonObject.put("catcherUrlPrefix", SysConfig.UEDITOR_PATH);
	    jsonObject.put("videoUrlPrefix", SysConfig.UEDITOR_PATH);
	    jsonObject.put("fileUrlPrefix", SysConfig.UEDITOR_PATH);
	    jsonObject.put("imageManagerUrlPrefix", SysConfig.UEDITOR_PATH);
	    jsonObject.put("fileManagerUrlPrefix", SysConfig.UEDITOR_PATH);
	    FileWriter fw;
		try {
			fw = new FileWriter(file);
			BufferedWriter bw = new BufferedWriter(fw);
		    bw.write(jsonObject.toString());
		    bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	private String filter(String input){
	    return input.replaceAll("/\\*[\\s\\S]*?\\*/", "");
	}
}
