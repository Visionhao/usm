package com.unicom.usm.modules.apiam.dao;

import com.unicom.usm.common.persistence.CrudDao;
import com.unicom.usm.common.persistence.annotation.MyBatisDao;
import com.unicom.usm.modules.apiam.entity.StopWordManage;

/**
 * 停用词管理的dao
 * @author vision
 *
 */

@MyBatisDao
public interface StopWordManageDao extends CrudDao<StopWordManage>{

	/**
	 * 查询全部数目
	 * @return
	 */
	public long findAllCount(StopWordManage stopWordManage);
	
	/**
	 * 更新信息
	 * @param 
	 * @return
	 */
	public int updateStopWordManageInfo(StopWordManage stopWordManage);
}
