package cn.qnight.common;

import java.lang.reflect.Method;

import org.springframework.util.ReflectionUtils;

/**
 * 反射工具类
 * 
 * @author wuchangwen
 *
 */
public class ReflectUtils {
	public static Object invokeMethod(Class<?> clazz,Object target,String methodName){
		
		Object result=null;
		try {
			Method targetMethod=clazz.getMethod(methodName);
			result=ReflectionUtils.invokeMethod(targetMethod, target);
		} catch (NoSuchMethodException e) {
			//TODO 异常处理
			e.printStackTrace();
		} 
		return result;
	}
}
