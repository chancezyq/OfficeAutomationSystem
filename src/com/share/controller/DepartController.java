package com.share.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mchange.v2.encounter.StrongEqualityEncounterCounter;
import com.share.bean.BranchManagement;
import com.share.bean.DepartBean;
import com.share.bean.DepartPojo;
import com.share.bean.UserBean;
import com.share.service.BranchManagementService;
import com.share.service.DepartService;
import com.share.service.UserService;
import com.sun.org.apache.regexp.internal.recompile;
import com.sun.org.apache.xml.internal.security.keys.keyresolver.implementations.PrivateKeyResolver;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import net.sf.json.JSON;
import net.sf.json.JSONObject;

@Controller
public class DepartController {

	@Autowired
	private DepartService departService;
	@Autowired
	private UserService userService;
	@Autowired
	private BranchManagementService branch;

	@RequestMapping("depart_management.do")
	public String findAllDepart(HttpServletRequest request, HttpServletResponse response) {
		List<DepartPojo> listDepartPojo = departService.findAllDepart();
		int count=listDepartPojo.size();
		System.out.println(listDepartPojo);
		request.getSession().setAttribute("listDepartPojo", listDepartPojo);
		request.getSession().setAttribute("departcount", count);
		return "showdepart";
	}

	@RequestMapping("updatedepart.do")
	public String edtion(HttpServletRequest request) {
		String s = request.getParameter("id");
		List<UserBean> list = userService.userShow();
		List<BranchManagement> list2 = branch.getAllBranchList();
		List<DepartPojo> listDepartPojo = departService.findAllDepart();
		for (DepartPojo departPojo : listDepartPojo) {
			if (departPojo.getT_departinfo_id().equals(s)) {
				request.getSession().setAttribute("departPojo", departPojo);
				request.getSession().setAttribute("userBean", list);
				request.getSession().setAttribute("branchBean", list2);
			}
		}
		return "updatedepart";
	}

	@RequestMapping("update.do")
	public String update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		departService.updateDepart(get(request));
		return "showdepart";
	}

	@RequestMapping("adddepart.do")
	public String addepart(HttpServletRequest request) {
		List<UserBean> list = userService.userShow();
		List<BranchManagement> list2 = branch.getAllBranchList();
		request.getSession().setAttribute("userBean", list);
		request.getSession().setAttribute("branchBean", list2);
		return "adddepart";
	}

	@RequestMapping("add.do")
	public String updatedepart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		departService.adddepart(get(request));
		return "showdepart";
	}

	public DepartBean get(HttpServletRequest request) {
		String departname = request.getParameter("departName");
		String userid = request.getParameter("userId");
		String branchid = request.getParameter("branchId");
		String departtel = request.getParameter("departTel");
		String departfaxes = request.getParameter("dapartFaxes");
		String departmobile = request.getParameter("departMobileTel");
		DepartBean departBean = new DepartBean(departname, branchid, userid, departtel, departmobile, departfaxes);
		return departBean;
	}

	@RequestMapping("delete.do")
	public String deleteDepart(HttpServletRequest request) {
		String departId = request.getParameter("departid");
		departService.deletrDepart(departId);
		System.out.println(departId);
		return "showdepart";
	}

	@RequestMapping("deleteAll.do")
	public String deleteAllDepart(HttpServletRequest request) {
		String text = request.getParameter("text");
		List<DepartPojo> list = new ArrayList<>();
		System.out.println("text:" + text);
		String[] departId = text.split(",");
		for (String string : departId) {
			departService.deletrDepart(string);
		}
		return "showdepart";
	}
}
