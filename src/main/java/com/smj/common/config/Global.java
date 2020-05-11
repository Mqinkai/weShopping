/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.smj.common.config;

import com.ckfinder.connector.ServletContextFactory;

/**
 * 全局配置类
 * @author ThinkGem
 * @version 2014-06-25
 */
public class Global {

	/**
	 * 获取管理端根路径
	 */
	public static String getAdminPath() {
 String adminPath="/smj";
		return adminPath;
	}
}
