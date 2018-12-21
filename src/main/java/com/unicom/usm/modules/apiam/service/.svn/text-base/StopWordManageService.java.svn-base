package com.unicom.usm.modules.apiam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.modules.apiam.dao.StopWordManageDao;
import com.unicom.usm.modules.apiam.entity.StopWordManage;

/**
 * 停用词管理service
 * @author vision
 *
 */

@Service
@Transactional(readOnly = true)
public class StopWordManageService extends CrudService<StopWordManageDao, StopWordManage>{

	@Autowired
	private StopWordManageDao stopWordManageDao;
	
	public Page<StopWordManage> findStopWordManage(Page<StopWordManage> page, StopWordManage stopWordManage) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
		stopWordManage.setPage(page);
		// 执行分页查询
		page.setList(stopWordManageDao.findList(stopWordManage));
		return page;
	}
	
	/**
	 * 无分页查询
	 * @param user
	 * @return
	 */
	public List<StopWordManage> findStopWordManage(StopWordManage stopWordManage){
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		List<StopWordManage> list = stopWordManageDao.findList(stopWordManage);
		return list;
	}

	@Transactional(readOnly = false)
	public void saveStopWordManage(StopWordManage stopWordManage) {
		if (StringUtils.isBlank(stopWordManage.getId())){
			stopWordManage.preInsert();
			stopWordManageDao.insert(stopWordManage);
		}else{
			stopWordManage.preUpdate();
			stopWordManageDao.update(stopWordManage);
		}
	}
	
	@Transactional(readOnly = false)
	public void update(StopWordManage stopWordManage) {
		stopWordManage.preUpdate();
		stopWordManageDao.update(stopWordManage);
	}
	
	
	
	@Transactional(readOnly = false)
	public void deleteStopWordManage(StopWordManage stopWordManage) {
		stopWordManageDao.delete(stopWordManage);
	}
	
	
}
