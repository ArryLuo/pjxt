package com.populook.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

public class ZipDelUtil {
	/**
	 * 解压文件到指定目录
	 * @param zipFile 解压文件
	 * @param descDir 指定的目录
	 * @param wareNo 模板编码
	 * @author luochaoqun
	 */
	@SuppressWarnings("rawtypes")
	public static void unZipFiles(File zipFile,String descDir,String wareNo)throws IOException{
		File pathFile = new File(descDir);
		if(!pathFile.exists()){
			pathFile.mkdirs();
		}
		boolean flag = isCorrect(zipFile);
		ZipFile zip = new ZipFile(zipFile,"GBK");
		for(Enumeration entries = zip.getEntries();entries.hasMoreElements();){
			ZipEntry entry = (ZipEntry)entries.nextElement();
			String zipEntryName = entry.getName();
			if(flag){
				Integer index = zipEntryName.indexOf("/");
				if(index!=-1){
					String paht=zipEntryName.substring(0,index);
					zipEntryName = zipEntryName.replaceAll(paht, wareNo);
				}
			}else {
				zipEntryName = wareNo + File.separator + zipEntryName;
			}
			InputStream in = zip.getInputStream(entry);
			String outPath = (descDir+zipEntryName).replaceAll("\\*", "/");;
			//判断路径是否存在,不存在则创建文件路径
			if(outPath.lastIndexOf("/")!=-1){
				File file = new File(outPath.substring(0, outPath.lastIndexOf('/')));
				if(!file.exists()){
					file.mkdirs();
				}
			}
			//判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压
			if(new File(outPath).isDirectory()){
				continue;
			}
			
			OutputStream out = new FileOutputStream(outPath);
			byte[] buf1 = new byte[1024];
			int len;
			while((len=in.read(buf1))>0){
				out.write(buf1,0,len);
			}
			in.close();
			out.close();
			}
		System.out.println("******************解压完毕********************");
	}
	
	
	@SuppressWarnings("rawtypes")
	public static boolean isCorrect(File zipFile) throws IOException{
		Set<String> dirStr=new HashSet<String>();
		ZipFile zip = new ZipFile(zipFile,"GBK");
		for(Enumeration entries = zip.getEntries();entries.hasMoreElements();){
			ZipEntry entry = (ZipEntry)entries.nextElement();
			if(entry.isDirectory()){
				String zipEntryName = entry.getName();
				Integer index = zipEntryName.indexOf("/");
				if(index!=-1){
					dirStr.add(zipEntryName.substring(0,index));
				}
			}
		}
		if(dirStr.size() == 1){
			return true;
		}
		return false;
	}
}
