package com.share.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.share.bean.BranchManagement;

/**
 * 机构管理权限操作
 * 
 * @author Administrator
 *
 */

@Repository
public interface BranchManagementDao {

	/**
	 * dao层获取所有机构信息
	 * 
	 * @return
	 */
	public List<BranchManagement> findAllBranch();

	/**
	 * dao层获取机构信息数量
	 * 
	 * @return
	 */
	public int findAllBranchCount();

	/**
	 * dao层添加机构
	 */
	public void addBranch(BranchManagement branch);

	/**
	 * dao层修改机构信息
	 * 
	 * @param branch
	 */
	public void updateBranch(BranchManagement branch);

	/**
	 * dao层删除机构信息
	 * 
	 * @param branchid
	 */
	public void deleteBranch(int branchid);

	/**
	 * 分页显示
	 */
	public List<BranchManagement> findAllBranchPage(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

	/**
	 * 分页条件查询机构
	 * 
	 * @param startPos
	 * @param pageSize
	 * @param searchbranch
	 * @return
	 */
	public List<BranchManagement> searchBranch(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize, @Param(value = "searchbranch") String searchbranch);

	/**
	 * 条件查询你机构总数量
	 * 
	 * @param searchbranch
	 * @return
	 */
	public int searchBranchCount(@Param(value = "searchbranch") String searchbranch);

	/**
	 * 批量删除数据
	 * 
	 * @param array
	 */

	public void deleteAllBranch(@Param(value="array")String[] array);
}
