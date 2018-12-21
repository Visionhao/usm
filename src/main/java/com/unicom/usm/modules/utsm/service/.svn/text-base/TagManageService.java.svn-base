package com.unicom.usm.modules.utsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.modules.utsm.dao.TagManageDao;
import com.unicom.usm.modules.utsm.entity.TagClassify;
import com.unicom.usm.modules.utsm.entity.TagManage;

/**
 * 标签管理service
 * @author vision
 *
 */

@Service
@Transactional(readOnly = true)
public class TagManageService extends CrudService<TagManageDao, TagManage>{

	@Autowired
	private TagManageDao tagManageDao;
	
	public Page<TagManage> findTagManage(Page<TagManage> page, TagManage tagManage) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
		tagManage.setPage(page);
		// 执行分页查询
		page.setList(tagManageDao.findList(tagManage));
		return page;
	}
	
	/**
	 * 无分页查询人员列表
	 * @param user
	 * @return
	 */
	public List<TagManage> findTagManage(TagManage tagManage){
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		List<TagManage> list = tagManageDao.findList(tagManage);
		return list;
	}

	/**
	 * 通过部门ID获取用户列表，仅返回用户id和name（树查询用户时用）
	 * @param user
	 * @return
	 */
	public List<TagManage> findUserByTagManageId(String tagManageId) {
		//List<User> list = (List<User>)CacheUtils.get(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId);
		//if (list == null){
		List<TagManage> list = null;
		TagManage tagManage = new TagManage();
		tagManage.setTagClassify(new TagClassify(tagManageId));
		list = tagManageDao.findUserByTagManageId(tagManage);
			//CacheUtils.put(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId, list);
		//}
		return list;
	}
	
	@Transactional(readOnly = false)
	public void saveTagManage(TagManage tagManage) {
		if (StringUtils.isBlank(tagManage.getId())){
			tagManage.preInsert();
			tagManageDao.insert(tagManage);
		}else{
			tagManage.preUpdate();
			tagManageDao.update(tagManage);
		}
			/*else{
			// 清除原用户机构用户缓存
			User oldUser = tagManageDao.get(user.getId());
			if (oldUser.getOffice() != null && oldUser.getOffice().getId() != null){
				CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + oldUser.getOffice().getId());
			}
			// 更新用户数据
			user.preUpdate();
			tagManageDao.update(user);
		}
		if (StringUtils.isNotBlank(user.getId())){
			// 更新用户与角色关联
			tagManageDao.deleteUserRole(user);
			if (user.getRoleList() != null && user.getRoleList().size() > 0){
				tagManageDao.insertUserRole(user);
			}else{
				throw new ServiceException(user.getLoginName() + "没有设置角色！");
			}
			// 将当前用户同步到Activiti
			saveActivitiUser(user);
			// 清除用户缓存
			UserUtils.clearCache(user);
//			// 清除权限缓存
//			systemRealm.clearAllCachedAuthorizationInfo();
		}*/
	}
	
	@Transactional(readOnly = false)
	public void update(TagManage tagManage) {
		tagManage.preUpdate();
		tagManageDao.update(tagManage);
		// 清除用户缓存
		//UserUtils.clearCache(user);
//		// 清除权限缓存
//		systemRealm.clearAllCachedAuthorizationInfo();
	}
	
	@Transactional(readOnly = false)
	public void startTagManage(TagManage tagManage) {
		tagManageDao.start(tagManage);
	}
	
	@Transactional(readOnly = false)
	public void pauseTagManage(TagManage tagManage) {
		tagManageDao.pause(tagManage);
	}
	
	@Transactional(readOnly = false)
	public void deleteTagManage(TagManage tagManage) {
		tagManageDao.delete(tagManage);
	}
}
