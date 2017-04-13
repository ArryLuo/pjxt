package com.populook.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.populook.framework.util.FolderUtils;

public class Upload {
	private static final Logger logger = LoggerFactory.getLogger(Upload.class);

	public static String uploadImg(String cimageFileName, File cimage) {
		int year = 0;
		int month = 0;
		int day = 0;
		Calendar cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;
		day = cal.get(Calendar.DATE);
		// 获取图片的文件名
		String fileName = cimageFileName;
		// 获取图片的扩展名
		String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 新的图片文件名 = 获取时间戳+"."图片扩展名
		String newFileName = String.valueOf(UUID.randomUUID().toString().replace("-", "")) + "." + extensionName;
		try {
			File yearFile = new File(SysConfig.IMG_UPLOAD_PATH+ File.separator + year);
			if (!yearFile.exists()) {
				yearFile.mkdirs();
			}
			File monthFile = new File(SysConfig.IMG_UPLOAD_PATH + File.separator + year + File.separator+ month);
			if (!monthFile.exists()) {
				monthFile.mkdirs();
			}
			File dayFile = new File(SysConfig.IMG_UPLOAD_PATH + File.separator + year + File.separator + month + File.separator + day);
			if (!dayFile.exists()) {
				dayFile.mkdirs();
			}
			FolderUtils.copyFile(cimage, newFileName, dayFile);
		} catch (Exception e) {
			logger.error("上传图片失败.", e);
		}
		String resultPath = year + File.separator + month + File.separator + day + File.separator + newFileName;
		return resultPath;
	}

	public static String excelPath() {
		int year = 0;
		int month = 0;
		int day = 0;
		Calendar cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;
		day = cal.get(Calendar.DATE);
		String fileName = System.currentTimeMillis() + ".xls";
		StringBuffer sb = new StringBuffer();
		sb.append(SysConfig.approval_UPLOAD_PATH + File.separator);
		sb.append(year + File.separator);
		sb.append(month + File.separator);
		sb.append(day + File.separator);
		//sb.append(fileName);

		File f = new File(sb.toString());
		if (!f.exists()) {
			f.mkdirs();
		}

		return f.toString()+File.separator+fileName;
	}
	
	public static String uploadExcel(String excelFileName, File excelFile) throws Exception {
		int year = 0;
		int month = 0;
		int day = 0;
		Calendar cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;
		day = cal.get(Calendar.DATE);
		String srcFilesName=year+File.separator+month+File.separator+day;
		HttpServletRequest request = ServletActionContext.getRequest();
		String logoRealPathDir = request.getSession().getServletContext().getRealPath("/upload/"+srcFilesName);
		// 获取excel的文件名
		String fileName = excelFileName;
		// 获取excel的扩展名
		String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 新的excel文件名 = 获取时间戳+"."excel扩展名
		String newFileName = String.valueOf(UUID.randomUUID().toString().replace("-", "")) + "." + extensionName;
		File srcFile = new File(logoRealPathDir);
		if (!srcFile.exists()) {
			srcFile.mkdirs();
		}
		try {
			FolderUtils.copyFile(excelFile, newFileName, srcFile);
		} catch (Exception e) {
			logger.error("上传excel失败.", e);
			throw e;
		}
		return srcFile + File.separator + newFileName;
	}
	

	public static boolean deleteFile(String filePath){
        return FileUtils.deleteQuietly(new File(filePath));
	}
	
}
