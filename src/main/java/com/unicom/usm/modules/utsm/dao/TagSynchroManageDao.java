package com.unicom.usm.modules.utsm.dao;

import com.unicom.usm.common.persistence.CrudDao;
import com.unicom.usm.common.persistence.annotation.MyBatisDao;
import com.unicom.usm.modules.utsm.entity.TagSynchroManage;

/**
 * 用户标签数据同步管理dao
 * @author vision
 *
 */

@MyBatisDao
public interface TagSynchroManageDao extends CrudDao<TagSynchroManage>{

	/**
	 * 查询全部数目
	 * @return
	 */
	public long findAllCount(TagSynchroManage tagSynchroManage);
}
