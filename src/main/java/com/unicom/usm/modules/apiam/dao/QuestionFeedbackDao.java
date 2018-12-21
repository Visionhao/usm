package com.unicom.usm.modules.apiam.dao;

import com.unicom.usm.common.persistence.CrudDao;
import com.unicom.usm.common.persistence.annotation.MyBatisDao;
import com.unicom.usm.modules.apiam.entity.QuestionFeedback;

/**
 * 
* 项目名称：usm
* 类名称：QuestionFeedbackDao
* 类描述：问题反馈的dao
* 创建人：vision
* 创建时间：2017年1月6日 下午2:06:31
* 修改备注：
* @version
*
 */

@MyBatisDao
public interface QuestionFeedbackDao extends CrudDao<QuestionFeedback>{

	/**
	 * 查询全部数目
	 * @return
	 */
	public long findAllCount(QuestionFeedback questionFeedback);
}
