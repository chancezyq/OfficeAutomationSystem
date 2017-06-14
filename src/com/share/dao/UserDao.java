package com.share.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.share.bean.UserBean;

@Component
public interface UserDao {
	// 添加用户
	public void userAdd(UserBean userBean);

	// 查询用户
	public List<UserBean> userShow();

	// 查询总条数
	public int userCountShow();

	// 删除用户
	public void userDelete(int id);

	// 修改用户
	public void userUpdate(UserBean userBean);

	// 按角色查找用户
	public List<UserBean> findUser(String id);

	// 按用户id查找
	public UserBean findUserRole(String id);

	/**
	 * 使用注解方式传入多个参数，用户分页
	 * 
	 * @param startPos
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public List<UserBean> selectUsersByPage(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

	/**
	 * 取得用户数量信息
	 * 
	 * @param 
	 * @return
	 */
	public int getUsersCount();
	
	//模糊搜索用户
	public List<UserBean> userSearch(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize,@Param(value="t_userinfo_name") String user);
	//取得模糊查询总数
	public int getUsersSearchCount(@Param(value="t_userinfo_name") String user);
}
