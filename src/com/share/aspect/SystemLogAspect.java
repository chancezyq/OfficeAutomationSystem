package com.share.aspect;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;

import com.share.bean.LogBean;
import com.share.bean.UserBean;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import sun.rmi.runtime.Log;

@Aspect
@Component
public class SystemLogAspect {
	@Autowired
	LogLogService logService;
	@Autowired
	HttpServletRequest request;

	/**
	 * 添加业务逻辑方法切入点
	 */
	@Pointcut("execution(* com.share.service.*.*add*(..))")
	public void insertServiceCall() {
	}

	@Pointcut("execution(* com.share.service.*.*Update*(..))")
	public void updateServiceCall() {
	}

	@Pointcut("execution(* com.share.service.*.*delete*(..))")
	public void deleteServiceCall() {
	}
	@Pointcut("execution(* com.share.service.*.*find*(..))&&args(..)")
	public void selectServiceCall(){
	}
	@AfterReturning(value = "insertServiceCall()")
	public void insertServiceCallCalls(JoinPoint joinPoint) throws Throwable {
		// 获取登录管理员姓名
		String username = (String) request.getSession().getAttribute("username");
		System.out.println("username" + username);
		if (username == null) {// 没有管理员登录
			return;
		}
		// 判断参数
		if (joinPoint.getArgs() == null) {// 没有参数
			return;
		}
		
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		System.out.println("methodName" + methodName);
		// 获取操作内容
		String opContent = adminOptionContent(joinPoint.getArgs(), methodName);
		System.out.println("opContent" + opContent);
		// 获取系统当前时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatDate = dateFormat.format(date);
		// 创建日志对象
		LogBean logBean = new LogBean();
		logBean.setT_operationlog_username(username);
		logBean.setT_operationlog_time(creatDate);
		logBean.setT_operationlog_content(opContent);
		logBean.setT_operationlog_name("添加");
		logService.add(logBean);
	}

	@AfterReturning(value = "updateServiceCall()")
	public void updateServiceCallCalls(JoinPoint joinPoint) throws Throwable {
		// 获取登录管理员姓名
		String username = (String) request.getSession().getAttribute("username");
		System.out.println("username" + username);
		if (username == null) {// 没有管理员登录
			return;
		}
		// 判断参数
		if (joinPoint.getArgs() == null) {// 没有参数
			return;
		}
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		System.out.println("methodName" + methodName);
		// 获取操作内容
		String opContent = adminOptionContent(joinPoint.getArgs(), methodName);
		System.out.println("opContent" + opContent);
		// 获取系统当前时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatDate = dateFormat.format(date);
		// 创建日志对象
		LogBean logBean = new LogBean();
		logBean.setT_operationlog_username(username);
		logBean.setT_operationlog_time(creatDate);
		logBean.setT_operationlog_content(opContent);
		logBean.setT_operationlog_name("修改");
		logService.add(logBean);
	}
	@AfterReturning(value = "deleteServiceCall()")
	public void deleteServiceCallCalls(JoinPoint joinPoint) throws Throwable {
		// 获取登录管理员姓名
		String username = (String) request.getSession().getAttribute("username");
		System.out.println("username" + username);
		if (username == null) {// 没有管理员登录
			return;
		}
		// 判断参数
		if (joinPoint.getArgs() == null) {// 没有参数
			return;
		}
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		System.out.println("methodName" + methodName);
		// 获取操作内容
		String opContent = adminOptionContent(joinPoint.getArgs(), methodName);
		System.out.println("opContent" + opContent);
		// 获取系统当前时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatDate = dateFormat.format(date);
		// 创建日志对象
		LogBean logBean = new LogBean();
		logBean.setT_operationlog_username(username);
		logBean.setT_operationlog_time(creatDate);
		logBean.setT_operationlog_content(opContent);
		logBean.setT_operationlog_name("刪除");
		logService.add(logBean);
	}
	 
		@AfterReturning(value = "selectServiceCall()", argNames = "rtv", returning = "rtv")
		public void selectServiceCallCalls(JoinPoint joinPoint, Object rtv) throws Throwable {

			// 获取登录管理员姓名
			String username = (String) request.getSession().getAttribute("username");

			if (username == null) {// 没有管理员登录
				return;
			}

			// 判断参数
			if (joinPoint.getArgs() == null) {// 没有参数
				return;
			}

			// 获取方法名
			String methodName = joinPoint.getSignature().getName();

			// 获取操作内容
			String opContent = adminOptionContent(joinPoint.getArgs(), methodName);
			// 获取系统当前时间
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String creatDate = dateFormat.format(date);
			// 创建日志对象
			LogBean logBean = new LogBean();
			logBean.setT_operationlog_username(username);
			logBean.setT_operationlog_time(creatDate);
			logBean.setT_operationlog_content(opContent);
			logBean.setT_operationlog_name("查询");

			logService.add(logBean);
		}

	/**
	 * 使用Java反射来获取被拦截方法(insert、update)的参数值， 将参数值拼接为操作内容
	 */
	public String adminOptionContent(Object[] args, String mName) throws Exception {

		if (args == null) {
			return null;
		}

		StringBuffer rs = new StringBuffer();
		rs.append(mName);
		String className = null;
		int index = 1;
		// 遍历参数对象
		for (Object info : args) {

			// 获取对象类型
			className = info.getClass().getName();
			className = className.substring(className.lastIndexOf(".") + 1);
			rs.append("[参数" + index + "，类型：" + className + "，值：");

			// 获取对象的所有方法
			Method[] methods = info.getClass().getDeclaredMethods();

			// 遍历方法，判断get方法
			for (Method method : methods) {

				String methodName = method.getName();
				// 判断是不是get方法
				if (methodName.indexOf("get") == -1) {// 不是get方法
					continue;// 不处理
				}

				Object rsValue = null;
				try {

					// 调用get方法，获取返回值
					rsValue = method.invoke(info);

					if (rsValue == null) {// 没有返回值
						continue;
					}

				} catch (Exception e) {
					continue;
				}

				// 将值加入内容中
				rs.append("(" + methodName + " : " + rsValue + ")");
			}

			rs.append("]");

			index++;
		}

		return rs.toString();
	}
}
