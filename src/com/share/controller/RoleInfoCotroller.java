package com.share.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.RoleInfoBean;
import com.share.bean.UserBean;
import com.share.service.RoleInfoService;
import com.share.service.UserService;

@Controller
public class RoleInfoCotroller {
	@Autowired
	RoleInfoService roleInfoService;
	@Autowired
	UserService userService;

	@RequestMapping("role_management.do")
	public String findRole(HttpServletRequest request){
		Map<RoleInfoBean, List<UserBean>> maprole=new LinkedHashMap<>();
		List<RoleInfoBean> listrole =roleInfoService.findRole();
		for (RoleInfoBean roleInfoBean : listrole) {
			List<UserBean> listUser = userService.findUser(roleInfoBean.getT_roleinfo_id());
			maprole.put(roleInfoBean, listUser);
		}
		request.getSession().setAttribute("maprole", maprole);
		return "roleinfo";
	}
	@RequestMapping("product-category-add.do") 
	public String go(){
		return "roleupdate";
	}
	@RequestMapping("rolefind")
	public String findUserRole(HttpServletRequest request){
		String id=request.getParameter("userid");
		
		System.out.println(id);
		UserBean userBean=userService.findUserRole(id);
		System.out.println(userBean);
		request.getSession().setAttribute("userBean", userBean);
		return "roleupdate";
		
	}
	@RequestMapping("roleupdate.do")
	public String updateRole(HttpServletRequest request){
		int roleid=Integer.parseInt(request.getParameter("role"));
		int stateid=Integer.parseInt(request.getParameter("role"));
		UserBean userBean=(UserBean) request.getSession().getAttribute("userBean");
		userBean.setT_roleinfo_id(roleid);
		userBean.setT_userstate_id(stateid);
		userService.userUpdate(userBean);
		return "welcome";
		
	}
}
