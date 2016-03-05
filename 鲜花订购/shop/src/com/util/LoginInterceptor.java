package com.util;

import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.util.TextParseUtil;

//登录拦截器
public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	private String loginUser;// session 中放的值；
	private String exclude;// 需要拦截的页面;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Set<String> set = TextParseUtil.commaDelimitedStringToSet(exclude);
		System.out.println(invocation.getProxy().getActionName());
		if (set.contains(invocation.getProxy().getActionName())) {
			Map<String, Object> session = invocation.getInvocationContext()
					.getContext().getSession();
			if (session.get(loginUser) != null) {
				return invocation.invoke();
			}
		} else {
			return invocation.invoke();
		}
		return "adminlogin";
	}

	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	public String getExclude() {
		return exclude;
	}

	public void setExclude(String exclude) {
		this.exclude = exclude;
	}

}