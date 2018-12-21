package com.unicom.usm.modules.apiam.dao;

import java.util.List;

import com.unicom.usm.common.persistence.CrudDao;
import com.unicom.usm.common.persistence.annotation.MyBatisDao;
import com.unicom.usm.modules.apiam.entity.TagRelatedMapping;

/**
 * 
*
* 项目名称：usm
* 类名称：TagRelatedMappingDao
* 类描述：标签相关词映射dao
* 创建人：vision
* 创建时间：2016年12月27日 上午10:07:28
* @version
*
 */

@MyBatisDao
public interface TagRelatedMappingDao extends CrudDao<TagRelatedMapping>{

	public List<TagRelatedMapping> findUserByTagManageId(TagRelatedMapping tagRelatedMapping);
	
	public List<TagRelatedMapping> findListData(TagRelatedMapping tagRelatedMapping);
	
}
