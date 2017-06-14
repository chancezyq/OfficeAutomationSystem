package com.share.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.UserBean;
import com.share.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// 添加用户
	@RequestMapping("useradd.do")
	public String userAdd(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("======系统进入用户添加=====");
		String id = request.getParameter("adminId");
		int id1 = Integer.parseInt(id);
		String name = request.getParameter("adminName");
		String password = request.getParameter("password");
		String departid = request.getParameter("depart");
		int departid1 = Integer.parseInt(departid);
		String sex = request.getParameter("sex");
		String role = request.getParameter("role");
		int role1 = Integer.parseInt(role);
		String state = request.getParameter("state");
		int state1 = Integer.parseInt(state);
		System.out.println(id + name + password + departid + sex + role + state);
		UserBean userBean = new UserBean(id1, name, password, departid1, sex, role1, state1);
		userService.userAdd(userBean);
		return "index";
	}

	// 显示用户
	@RequestMapping("user_management.do")
	public void userShow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<UserBean> userlist = userService.userShow();
		request.setAttribute("userlist", userlist);
		// 查询用户表条数
		int count = userService.userCountShow();
		request.setAttribute("count", count);
		// return "usershow";
		request.getRequestDispatcher("myProductPage.do").forward(request, response);
	}

	// 删除用户
	@RequestMapping("userdelete.do")
	public String userDelete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		System.out.println("系统进入删除用户");
		System.out.println(id1);
		userService.userDelete(id1);
		return "usershow";
	}

	// 跳转到添加页面
	@RequestMapping("useradd1.do")
	public String forward() {
		return "useradd";
	}

	// 跳转到修改页面
	@RequestMapping("userupdate1.do")
	public String forward1(HttpServletRequest request, HttpServletResponse response) {
		// try {
		// //跳转到修改用户界面
		// request.getRequestDispatcher("/WEB-INF/jsp/userupdate.jsp").forward(request,
		// response);
		// } catch (ServletException | IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		return "userupdate";
	}

	// 修改用户
	@RequestMapping("userupdate.do")
	public void userUpdate(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("系统进入修改用户");
		// String id = request.getParameter("id");
		// int id1 = Integer.parseInt(id);
		// String name = request.getParameter("name");
		// String departid = request.getParameter("departid");
		// int departid1 = Integer.parseInt(departid);
		// String gender = request.getParameter("gender");
		// String roleid = request.getParameter("roleid");
		// int roleid1 = Integer.parseInt(roleid);
		// String stateid = request.getParameter("stateid");
		// int stateid1 = Integer.parseInt(stateid);
		// UserBean userBean = new UserBean();
		// userBean.setT_userinfo_id(id1);
		// userBean.setT_userinfo_name(name);
		// userBean.setT_departinfo_id(departid1);
		// userBean.setT_userinfo_gender(gender);
		// userBean.setT_roleinfo_id(roleid1);
		// userBean.setT_userstate_id(stateid1);
		String id = request.getParameter("adminId");
		int id1 = Integer.parseInt(id);
		String name = request.getParameter("adminName");
		String password = request.getParameter("password");
		String departid = request.getParameter("depart");
		int departid1 = Integer.parseInt(departid);
		String sex = request.getParameter("sex");
		String role = request.getParameter("role");
		int role1 = Integer.parseInt(role);
		String state = request.getParameter("state");
		int state1 = Integer.parseInt(state);
		System.out.println(id + name + password + departid + sex + role + state);
		UserBean userBean = new UserBean(id1, name, password, departid1, sex, role1, state1);
		userService.userUpdate(userBean);
		// 跳转到用户展示页
		try {
			request.getRequestDispatcher("user_management.do").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 用户分页
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("myProductPage.do")
	public String showMyUser(HttpServletRequest request, Model model) {

		this.userService.showUsersByPage(request, model);

		return "usershow";
	}

	// 用户模糊搜索
	@RequestMapping("usersearch.do")
	public String userSearch(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("==========系统进入用户搜索==========");
		String username = request.getParameter("username1");
		// request.getSession().setAttribute("username1", username);
		// UserBean user = new UserBean();
		// user.setT_userinfo_name(username);
		// System.out.println("======模糊查询的用户名为：======="+user.getT_userinfo_name());
		this.userService.userSearch(request, model, username);
		return "usersearchshow";
	}

	// 批量删除用户
	@RequestMapping("usersdelete.do")
	public void usersDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 系统进入批量删除
		System.out.println("==========系统进入批量删除=========");
		String userid =request.getParameter("ids");
		String userids[] = userid.split(","); 
		for (int i = 0; i < userids.length; i++) {
			System.out.println(userids[i]);
			System.out.println("=====批量删除传递参数====");
			int id = Integer.parseInt(userids[i]);
			userService.userDelete(id);
		}
		request.getRequestDispatcher("user_management.do").forward(request, response);
	}

}
