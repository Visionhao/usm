package com.unicom.usm.modules.utsm.dao;

import java.util.List;

import com.unicom.usm.common.persistence.CrudDao;
import com.unicom.usm.common.persistence.annotation.MyBatisDao;
import com.unicom.usm.modules.utsm.entity.TagManage;
/**
 * 标签管理dao
 * @author vision
 *
 */

@MyBatisDao
public interface TagManageDao extends CrudDao<TagManage>{

	/**
	 * 根据登录名称查询用户
	 * @param loginName
	 * @return
	 */
	//public User getByLoginName(User user);

	/**
	 * 通过TagManageId获取用户列表，仅返回用户id和name（树查询用户时用）
	 * @param TagManage
	 * @return
	 */
	public List<TagManage> findUserByTagManageId(TagManage tagManage);
	
	/**
	 * 查询全部用户数目
	 * @return
	 */
	public long findAllCount(TagManage tagManage);
	
	/**
	 * 更新用户密码
	 * @param user
	 * @return
	 */
	//public int updatePasswordById(TagManage tagManage);
	
	/**
	 * 更新登录信息，如：登录IP、登录时间
	 * @param user
	 * @return
	 */
	//public int updateLoginInfo(TagManage tagManage);

	/**
	 * 删除用户角色关联数据
	 * @param user
	 * @return
	 */
	//public int deleteUserRole(User user);
	
	/**
	 * 插入用户角色关联数据
	 * @param user
	 * @return
	 */
	//public int insertUserRole(User user);
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateTagManageInfo(TagManage tagManage);
	
}
