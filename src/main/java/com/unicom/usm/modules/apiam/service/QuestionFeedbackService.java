package com.unicom.usm.modules.apiam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.modules.apiam.dao.QuestionFeedbackDao;
import com.unicom.usm.modules.apiam.entity.QuestionFeedback;

/**
 * 
*
* 项目名称：usm
* 类名称：QuestionFeedbackService
* 类描述：问题反馈的service
* 创建人：vision
* 创建时间：2017年1月6日 下午2:10:59
* 修改备注：
* @version
*
 */

@Service
@Transactional(readOnly = true)
public class QuestionFeedbackService extends CrudService<QuestionFeedbackDao, QuestionFeedback>{

	@Autowired
	private QuestionFeedbackDao questionFeedbackDao;
	
	public Page<QuestionFeedback> findQuestionFeedback(Page<QuestionFeedback> page, QuestionFeedback questionFeedback) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
		questionFeedback.setPage(page);
		// 执行分页查询
		page.setList(questionFeedbackDao.findList(questionFeedback));
		return page;
	}
	
	/**
	 * 无分页查询
	 * @param user
	 * @return
	 */
	public List<QuestionFeedback> findQuestionFeedback(QuestionFeedback questionFeedback){
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		List<QuestionFeedback> list = questionFeedbackDao.findList(questionFeedback);
		return list;
	}

	@Transactional(readOnly = false)
	public void saveQuestionFeedback(QuestionFeedback questionFeedback) {
		questionFeedback.preInsert();
		questionFeedbackDao.insert(questionFeedback);
	}
	
	@Transactional(readOnly = false)
	public void update(QuestionFeedback questionFeedback) {
		questionFeedback.preUpdate();
		questionFeedbackDao.update(questionFeedback);
	}
	
	
	
	@Transactional(readOnly = false)
	public void deleteQuestionFeedback(QuestionFeedback questionFeedback) {
		questionFeedbackDao.delete(questionFeedback);
	}
}
