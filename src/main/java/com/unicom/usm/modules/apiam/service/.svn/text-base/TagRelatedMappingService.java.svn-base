package com.unicom.usm.modules.apiam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.modules.apiam.dao.TagRelatedMappingDao;
import com.unicom.usm.modules.apiam.entity.TagRelatedMapping;
import com.unicom.usm.modules.utsm.entity.TagManage;

@Service
@Transactional(readOnly = true)
public class TagRelatedMappingService extends CrudService<TagRelatedMappingDao, TagRelatedMapping>{

	@Autowired
	private TagRelatedMappingDao tagRelatedMappingDao;
	
	public Page<TagRelatedMapping> findTagRelatedMapping(Page<TagRelatedMapping> page, TagRelatedMapping tagRelatedMapping) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
		tagRelatedMapping.setPage(page);
		// 执行分页查询
		page.setList(tagRelatedMappingDao.findList(tagRelatedMapping));
		return page;
	}
	
	public Page<TagRelatedMapping> findListData(Page<TagRelatedMapping> page, TagRelatedMapping tagRelatedMapping) {
		// 设置分页参数
		tagRelatedMapping.setPage(page);
		// 执行分页查询
		page.setList(tagRelatedMappingDao.findListData(tagRelatedMapping));
		return page;
	}
	
	/**
	 * 无分页查询
	 * @param tagRelatedMapping
	 * @return
	 */
	public List<TagRelatedMapping> findTagRelatedMapping(TagRelatedMapping tagRelatedMapping){
		List<TagRelatedMapping> list = tagRelatedMappingDao.findList(tagRelatedMapping);
		return list;
	}
	
	@Transactional(readOnly = false)
	public void saveTagRelatedMapping(TagRelatedMapping tagRelatedMapping) {
		tagRelatedMapping.preInsert();
		tagRelatedMappingDao.insert(tagRelatedMapping);
	}
	
	@Transactional(readOnly = false)
	public void updateTagRelatedMapping(TagRelatedMapping tagRelatedMapping) {
		tagRelatedMapping.preUpdate();
		tagRelatedMappingDao.update(tagRelatedMapping);
	}
	
	
	@Transactional(readOnly = false)
	public void deleteTagRelatedMapping(TagRelatedMapping tagRelatedMapping) {
		tagRelatedMappingDao.delete(tagRelatedMapping);
	}
	
	/**
	 * 通过部门ID获取用户列表，仅返回用户id和name（树查询用户时用）
	 * @param user
	 * @return
	 */
	public List<TagRelatedMapping> findUserByTagManageId(String tagManageId) {
		//List<User> list = (List<User>)CacheUtils.get(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId);
		//if (list == null){
		List<TagRelatedMapping> list = null;
		TagRelatedMapping tagRelatedMapping = new TagRelatedMapping();
		tagRelatedMapping.setTagManage(new TagManage(tagManageId));
		list = tagRelatedMappingDao.findUserByTagManageId(tagRelatedMapping);
			//CacheUtils.put(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId, list);
		//}
		return list;
	}
}
