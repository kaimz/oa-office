/**
* @Title: PropertyUtil.java
* @Package cn.qnight.common
* @Description: TODO(用一句话描述该文件做什么)
* @author qnight
* @date 2017年8月17日
* @version V1.0
*/
package cn.qnight.common;

import java.io.InputStream;
import java.util.Properties;

/**
* @ClassName: PropertyUtil
* @Description: TODO(这里用一句话描述这个类的作用)
* @author 张凯
* @date 2017年8月17日
*
*/
public class PropertyUtil {
	public static final Properties PROP = new Properties();

	/**
	 * 读取配置文件的内容（key，value）
	 * 
	 * @param key
	 * @return key对应的value
	 */
	public static String get(String key) {
		if (PROP.isEmpty()) {
			try {
				InputStream in = PropertyUtil.class.getResourceAsStream("/config.properties");
				PROP.load(in);
				in.close();
			} catch (Exception e) {}
		}
		return PROP.getProperty(key);
	}
}
