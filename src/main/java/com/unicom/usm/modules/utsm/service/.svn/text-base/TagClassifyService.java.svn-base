package com.unicom.usm.modules.utsm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.service.TreeService;
import com.unicom.usm.modules.sys.utils.UserUtils;
import com.unicom.usm.modules.utsm.dao.TagClassifyDao;
import com.unicom.usm.modules.utsm.entity.TagClassify;

/**
 * 标签分类service
 * @author vision
 *
 */

@Service
@Transactional(readOnly = true)
public class TagClassifyService extends TreeService<TagClassifyDao, TagClassify> {
	
	public List<TagClassify> findAll(){
		return UserUtils.getTagClassifyList();
	}

	public List<TagClassify> findList(Boolean isAll){
		if (isAll != null && isAll){
			return UserUtils.getTagClassifyAllList();
		}else{
			return UserUtils.getTagClassifyAllList();
		}
	}
	
	@Transactional(readOnly = true)
	public List<TagClassify> findList(TagClassify tagClassify){
		if(tagClassify != null){
			tagClassify.setParentIds(tagClassify.getParentIds()+"%");
			return dao.findByParentIdsLike(tagClassify);
		}
		return  new ArrayList<TagClassify>();
	}
	
	@Transactional(readOnly = false)
	public void save(TagClassify tagClassify) {
		super.save(tagClassify);
		UserUtils.removeCache(UserUtils.CACHE_TAGCLASSITY_LIST);
	}
	
	@Transactional(readOnly = false)
	public void delete(TagClassify tagClassify) {
		super.delete(tagClassify);
		UserUtils.removeCache(UserUtils.CACHE_TAGCLASSITY_LIST);
	}
}
