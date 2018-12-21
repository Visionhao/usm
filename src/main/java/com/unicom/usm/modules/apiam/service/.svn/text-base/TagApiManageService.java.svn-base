package com.unicom.usm.modules.apiam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.modules.apiam.dao.TagApiManageDao;
import com.unicom.usm.modules.apiam.entity.TagApiManage;

/**
 * 接口定义
 * @author vision
 *
 */

@Service
@Transactional(readOnly = true)
public class TagApiManageService extends CrudService<TagApiManageDao, TagApiManage>{

	@Autowired
	private TagApiManageDao tagApiManageDao;
	
	public Page<TagApiManage> findTagApiManage(Page<TagApiManage> page, TagApiManage tagApiManage) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
		tagApiManage.setPage(page);
		// 执行分页查询
		page.setList(tagApiManageDao.findList(tagApiManage));
		return page;
	}
	
	/**
	 * 无分页查询
	 * @param user
	 * @return
	 */
	public List<TagApiManage> findTagApiManage(TagApiManage tagApiManage){
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		List<TagApiManage> list = tagApiManageDao.findList(tagApiManage);
		return list;
	}

	@Transactional(readOnly = false)
	public void saveTagApiManage(TagApiManage tagApiManage) {
		if (StringUtils.isBlank(tagApiManage.getId())){
			tagApiManage.preInsert();
			tagApiManageDao.insert(tagApiManage);
		}else{
			tagApiManage.preUpdate();
			tagApiManageDao.update(tagApiManage);
		}
	}
	
	@Transactional(readOnly = false)
	public void update(TagApiManage tagApiManage) {
		tagApiManage.preUpdate();
		tagApiManageDao.update(tagApiManage);
	}
	
	@Transactional(readOnly = false)
	public void startTagApiManage(TagApiManage tagApiManage) {
		tagApiManageDao.start(tagApiManage);
	}
	
	@Transactional(readOnly = false)
	public void pauseTagApiManage(TagApiManage tagApiManage) {
		tagApiManageDao.pause(tagApiManage);
	}
	
	@Transactional(readOnly = false)
	public void deleteTagApiManage(TagApiManage tagApiManage) {
		tagApiManageDao.delete(tagApiManage);
	}
}
