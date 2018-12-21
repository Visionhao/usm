package com.unicom.usm.modules.apiam.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.common.web.BaseController;
import com.unicom.usm.modules.apiam.entity.QuestionFeedback;
import com.unicom.usm.modules.apiam.service.QuestionFeedbackService;
import com.unicom.usm.modules.sys.utils.UserUtils;

/**
 * 
*
* 项目名称：usm
* 类名称：QuestionFeedbackController
* 类描述：问题反馈的controller
* 创建人：vision
* 创建时间：2017年1月6日 下午2:23:29
* 修改备注：
* @version
*
 */
@Controller
@RequestMapping(value = "${adminPath}/apiam/questionFeedback")
public class QuestionFeedbackController extends BaseController{
	
	@Autowired
	private QuestionFeedbackService questionFeedbackService;
	
	@ModelAttribute("questionFeedback")
	public QuestionFeedback get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return questionFeedbackService.get(id);
		}else{
			return new QuestionFeedback();
		}
	}

	@RequiresPermissions("apiam:questionFeedback:view")
	@RequestMapping(value = {"list", ""})
	public String list(QuestionFeedback questionFeedback, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<QuestionFeedback> page = questionFeedbackService.findQuestionFeedback(new Page<QuestionFeedback>(request, response), questionFeedback);
        model.addAttribute("page", page);
		return "modules/apiam/questionFeedbackList";
	}
	
	@ResponseBody
	@RequiresPermissions("apiam:questionFeedback:view")
	@RequestMapping(value = {"listData"})
	public Page<QuestionFeedback> listData(QuestionFeedback questionFeedback, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<QuestionFeedback> page = questionFeedbackService.findQuestionFeedback(new Page<QuestionFeedback>(request, response), questionFeedback);
		return page;
	}
	
	//添加内容
	@RequiresPermissions("apiam:questionFeedback:view")
	@RequestMapping(value = "form")
	public String form(QuestionFeedback questionFeedback, Model model) {
		model.addAttribute("questionFeedback", questionFeedback);
		//model.addAttribute("allRoles", systemService.findAllRole());
		return "modules/apiam/questionFeedbackForm";
	}

	@RequiresPermissions("apiam:questionFeedback:save")
	@RequestMapping(value = "save")
	public String save(QuestionFeedback questionFeedback, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		questionFeedback.setCreateDate(new Date());
		if (!beanValidator(model, questionFeedback)){
			return form(questionFeedback, model);
		}
		// 保存信息
		questionFeedbackService.saveQuestionFeedback(questionFeedback);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:" + adminPath + "/apiam/questionFeedback/list?repage";
	}
	
	
	//修改内容
	@RequiresPermissions("apiam:questionFeedback:view")
	@RequestMapping(value = "edit")
	public String edit(QuestionFeedback questionFeedback, Model model) {
		model.addAttribute("questionFeedback", questionFeedback);
		//model.addAttribute("allRoles", systemService.findAllRole());
		return "modules/apiam/questionFeedbackEdit";
	}
	@RequiresPermissions("apiam:questionFeedback:update")
	@RequestMapping(value = "update")
	public String update(QuestionFeedback questionFeedback, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, questionFeedback)){
			return form(questionFeedback, model);
		}
		if (questionFeedback.getReUser() == null){
			questionFeedback.setReUser(UserUtils.getUser());
			questionFeedback.setReDate(new Date());
		}
		// 保存信息
		questionFeedbackService.update(questionFeedback);
		addMessage(redirectAttributes, "修改成功");
		return "redirect:" + adminPath + "/apiam/questionFeedback/list?repage";
	}
	
	
	
	
	@RequiresPermissions("apiam:questionFeedback:edit")
	@RequestMapping(value = "delete")
	public String delete(QuestionFeedback questionFeedback, RedirectAttributes redirectAttributes) {
		questionFeedbackService.deleteQuestionFeedback(questionFeedback);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + adminPath + "/apiam/questionFeedback/list?repage";
	}

}
