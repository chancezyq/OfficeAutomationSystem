package com.share.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.BranchManagement;
import com.share.service.BranchManagementService;

@Controller
public class BranchManagementController {

	@Autowired
	private BranchManagementService branchmanagementservice;

	/**
	 * 查询所有机构信息
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping("/branch_management.do")
	public String findallbranch(HttpServletRequest request, Model model) {
		List<BranchManagement> branchmlist = branchmanagementservice.getAllBranchList();
		int count = branchmanagementservice.getAllBranchCount();
		branchmanagementservice.findAllBranchPage(request, model);
		request.setAttribute("branchmlist", branchmlist);
		request.setAttribute("count", count);
		return "branchmanagement";

	}

	/**
	 * 添加机构信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */

	@RequestMapping("/AddBranch.do")
	public void addBranch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String branchid1 = request.getParameter("branchid");
		int branchid = Integer.parseInt(branchid1);
		String branchname1 = request.getParameter("branchname1");
		String branchname2 = request.getParameter("branchname2");
		BranchManagement branch = new BranchManagement();

		branch.setT_branchinfo_id(branchid);
		branch.setT_branchinfo_name(branchname1);
		branch.setT_branchinfo_shortname(branchname2);

		branchmanagementservice.addBranch(branch);
		request.getRequestDispatcher("branch_management.do").forward(request, response);

	}

	/**
	 * 修改机构信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/UpdateBranch.do")
	public void updateBranch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String branchid1 = request.getParameter("branchid");
		int branchid = Integer.parseInt(branchid1);
		String branchname1 = request.getParameter("branchname1");
		String branchname2 = request.getParameter("branchname2");
		BranchManagement branch = new BranchManagement();

		branch.setT_branchinfo_id(branchid);
		branch.setT_branchinfo_name(branchname1);
		branch.setT_branchinfo_shortname(branchname2);

		branchmanagementservice.updateBranch(branch);
		request.getRequestDispatcher("branch_management.do").forward(request, response);
	}

	/**
	 * 删除机构信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/DeleteBranch.do")
	public void deleteBranch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String branchid1 = request.getParameter("branchid");
		int branchid = Integer.parseInt(branchid1);

		branchmanagementservice.deleteBranch(branchid);
		request.getRequestDispatcher("branch_management.do").forward(request, response);

	}

	/**
	 * 条件查询机构
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/searchBranch.do")
	public String searchBranch(HttpServletRequest request, Model model) {
		String searchbranch = request.getParameter("searchbranch");
		System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::" + searchbranch);
		branchmanagementservice.searchBranch(request, model, searchbranch);
		return "branchmanagement";

	}
@RequestMapping("/deleteAllBranch.do")
	public void deleteAllBranch(HttpServletRequest request, HttpServletResponse response)
			throws Exception, IOException {
		String array1 = request.getParameter("branchid");	
		String[] array=array1.split(",");
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + Arrays.toString(array));
		branchmanagementservice.deleteAllBranch(array);
		request.getRequestDispatcher("branch_management.do").forward(request, response);
	}

	// 页面跳转
	@RequestMapping("/addbranch.do")
	public String forword() {
		return "addbranch";
	}

	// 修改跳转
	@RequestMapping("/updatebranch.do")
	public String forwordone() {
		return "updatebranch";
	}

}
