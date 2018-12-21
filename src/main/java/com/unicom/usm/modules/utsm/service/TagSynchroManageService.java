package com.unicom.usm.modules.utsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.modules.utsm.dao.TagSynchroManageDao;
import com.unicom.usm.modules.utsm.entity.TagSynchroManage;

/**
 * 
 * @author vision
 * 标签同步管理service
 */

@Service
@Transactional(readOnly = true)
public class TagSynchroManageService extends CrudService<TagSynchroManageDao, TagSynchroManage>{

	@Autowired
	private TagSynchroManageDao tagSynchroManageDao;
	
	public Page<TagSynchroManage> findTagSynchroManage(Page<TagSynchroManage> page, TagSynchroManage tagSynchroManage) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
		tagSynchroManage.setPage(page);
		// 执行分页查询
		page.setList(tagSynchroManageDao.findList(tagSynchroManage));
		return page;
	}
	
	/**
	 * 无分页查询
	 * @param TagSynchroManage
	 * @return
	 */
	public List<TagSynchroManage> findTagSynchroManage(TagSynchroManage tagSynchroManage){
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		List<TagSynchroManage> list = tagSynchroManageDao.findList(tagSynchroManage);
		return list;
	}
}
