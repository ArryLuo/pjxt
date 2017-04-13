/**
 * 
 */
package com.populook.util;

import org.apache.log4j.Logger;

/**
 * @author zhangchao
 * 
 */
public class SysConfig {

	private static final Logger LOGGER = Logger.getLogger(SysConfig.class);

	// 默认自动登录15天
	public static Integer SESSION_EXPIRY = 60 * 60 * 24 * 15;
	
	// 图片上传的路径
	public static String IMG_UPLOAD_PATH = "D:\\apache-tomcat-upload\\webapps\\upload";
	
	public static String TEMPLATE_PATH="D:\\apache-tomcat-upload\\webapps\\upload\\";
	
	// 图片对外访问的url
	public static String IMG_PREFIX_URL = "http://localhost:9090/upload/";
	
	// 审批Excel文件的保存路径
	public static String approval_UPLOAD_PATH = "D:\\apache-tomcat-upload\\webapps\\excel_upload";
	
	//审批Excel文件对外访问的url
	public static String approval_PREFIX_URL = "http://localhost:9090/excel_upload/";
	
	//默认密码
	public static String OP_DEFAULT_PWD = "123456";
	
	public static String UEDITOR_PATH="http://localhost:8080/edu-manage";
	
//	
//	static{
//		init();
//	}
//	
//	public static void init() {
//		try {
//			SESSION_EXPIRY = Integer.valueOf(new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							SESSION_EXPIRY = Integer.valueOf(new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/session.expiry")));
//						}
//
//					}).forPath("/sys_conf/session.expiry")));
//
//			IMG_UPLOAD_PATH = new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							IMG_UPLOAD_PATH = new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/img.upload.path"));
//						}
//
//					}).forPath("/sys_conf/img.upload.path"));
//			IMG_PREFIX_URL = new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							IMG_PREFIX_URL = new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/img.prefix.url"));
//						}
//
//					}).forPath("/sys_conf/img.prefix.url"));
//			
//			approval_UPLOAD_PATH = new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							IMG_UPLOAD_PATH = new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/excel.upload.path"));
//						}
//
//					}).forPath("/sys_conf/excel.upload.path"));
//			approval_PREFIX_URL = new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							approval_PREFIX_URL = new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/excel.prefix.url"));
//						}
//
//					}).forPath("/sys_conf/excel.prefix.url"));
//			
//			OP_DEFAULT_PWD = new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							OP_DEFAULT_PWD = new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/op.defaultpwd"));
//						}
//
//					}).forPath("/sys_conf/op.defaultpwd"));
//			
//			CW_PREVIEW_URL = new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							CW_PREVIEW_URL = new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/cw.preview.url"));
//						}
//
//					}).forPath("/sys_conf/cw.preview.url"));
//			UEDITOR_PATH = new String(new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							UEDITOR_PATH = new String(new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/ueditor.path")));
//						}
//
//					}).forPath("/sys_conf/ueditor.path")));
//			TEMPLATE_PATH=new String(new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							UEDITOR_PATH = new String(new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/template.path")));
//						}
//
//					}).forPath("/sys_conf/template.path")));
//			REFRESH_HOSTS=new String(new String(ZooKeeperHolder
//					.getClient().getData().usingWatcher(new CuratorWatcher() {
//
//						@Override
//						public void process(WatchedEvent arg0) throws Exception {
//							REFRESH_HOSTS = new String(new String(
//									ZooKeeperHolder.getClient().getData()
//											.forPath("/sys_conf/cache.refreshHosts")));
//						}
//
//					}).forPath("/sys_conf/cache.refreshHosts")));
//		} catch (Exception ex) {
//			LOGGER.error(ex.getMessage(), ex);
//		}
//	}
//	
	
}
