package com.share.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.BranchManagement;
import com.share.dao.BranchManagementDao;
import com.share.util.Page;

@Service
public class BranchManagementService {

	@Autowired
	private BranchManagementDao branchmanagementdao;

	/**
	 * service层获取机构所有信息
	 * 
	 * @return
	 */

	public List<BranchManagement> getAllBranchList() {
		return branchmanagementdao.findAllBranch();
	}

	/**
	 * service层获取机构数量
	 * 
	 * @return
	 */
	public int getAllBranchCount() {
		return branchmanagementdao.findAllBranchCount();

	}

	/**
	 * service层添加机构
	 * 
	 * @param branch
	 * @return
	 */
	public String addBranch(BranchManagement branch) {
		String str = "branchmanagement";
		branchmanagementdao.addBranch(branch);
		return str;
	}

	/**
	 * service层修改机构
	 * 
	 * @param branch
	 * @return
	 */
	public String updateBranch(BranchManagement branch) {
		String str = "branchmanagement";
		branchmanagementdao.updateBranch(branch);
		return str;

	}

	public String deleteBranch(int branchid) {
		String str = "branchmanagement";
		branchmanagementdao.deleteBranch(branchid);
		return str;

	}

	/**
	 * 分页显示机构信息
	 * 
	 * @param request
	 * @param model
	 */
	public void findAllBranchPage(HttpServletRequest request, Model model) {
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		List<BranchManagement> branchmanagement = new ArrayList<BranchManagement>();
		int totalCount = branchmanagementdao.findAllBranchCount();

		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			branchmanagement = branchmanagementdao.findAllBranchPage(page.getStartPos(), page.getPageSize());
			System.out.println();
		} else {
			page = new Page(totalCount, 1);
			branchmanagement = branchmanagementdao.findAllBranchPage(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("branchmanagement", branchmanagement);
		model.addAttribute("page", page);
	}

	/**
	 * 条件查询机构信息并进行分页显示
	 * 
	 * @param request
	 * @param model
	 */
	public void searchBranch(HttpServletRequest request, Model model, String searchbranch) {
		String pageNow = request.getParameter("pageNow");

		Page page = null;
		List<BranchManagement> branchmanagement = new ArrayList<BranchManagement>();
		int totalCount = branchmanagementdao.searchBranchCount(searchbranch);

		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			branchmanagement = branchmanagementdao.searchBranch(page.getStartPos(), page.getPageSize(), searchbranch);
			System.out.println();
		} else {
			page = new Page(totalCount, 1);
			branchmanagement = branchmanagementdao.searchBranch(page.getStartPos(), page.getPageSize(), searchbranch);
		}
		model.addAttribute("branchmanagement", branchmanagement);
		model.addAttribute("page", page);
		model.addAttribute("count", totalCount);
	}

	/**
	 * 批量删除数据库信息
	 * 
	 * @param array
	 */
	public void deleteAllBranch(String[] array) {
		branchmanagementdao.deleteAllBranch(array);
	}

}
