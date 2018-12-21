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
import com.unicom.usm.modules.apiam.entity.TagApiManage;
import com.unicom.usm.modules.apiam.service.TagApiManageService;

/**
 * 
 * @author vision
 * 接口定义
 */

@Controller
@RequestMapping(value = "${adminPath}/apiam/tagApiManage")
public class TagApiManageController extends BaseController{

	@Autowired
	private TagApiManageService tagApiManageService;
	
	@ModelAttribute("tagApiManage")
	public TagApiManage get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return tagApiManageService.get(id);
		}else{
			return new TagApiManage();
		}
	}

	@RequiresPermissions("apiam:tagApiManage:view")
	@RequestMapping(value = {"list", ""})
	public String list(TagApiManage tagApiManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TagApiManage> page = tagApiManageService.findTagApiManage(new Page<TagApiManage>(request, response), tagApiManage);
        model.addAttribute("page", page);
		return "modules/apiam/tagApiManageList";
	}
	
	@ResponseBody
	@RequiresPermissions("apiam:tagApiManage:view")
	@RequestMapping(value = {"listData"})
	public Page<TagApiManage> listData(TagApiManage tagApiManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TagApiManage> page = tagApiManageService.findTagApiManage(new Page<TagApiManage>(request, response), tagApiManage);
		return page;
	}
	
	@RequiresPermissions("apiam:tagApiManage:view")
	@RequestMapping(value = "form")
	public String form(TagApiManage tagApiManage, Model model) {
		model.addAttribute("tagApiManage", tagApiManage);
		//model.addAttribute("allRoles", systemService.findAllRole());
		return "modules/apiam/tagApiManageForm";
	}

	@RequiresPermissions("apiam:tagApiManage:edit")
	@RequestMapping(value = "save")
	public String save(TagApiManage tagApiManage, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		
		//tagManage.setCategoryId(request.getParameter("tagClassify.id"));
		tagApiManage.setCreateTime(new Date());
		tagApiManage.setApiStatus("01");
		if (!beanValidator(model, tagApiManage)){
			return form(tagApiManage, model);
		}
		// 保存信息
		tagApiManageService.saveTagApiManage(tagApiManage);
		addMessage(redirectAttributes, "保存'" + tagApiManage.getApiName() + "'成功");
		return "redirect:" + adminPath + "/apiam/tagApiManage/list?repage";
	}
	
	@RequiresPermissions("apiam:tagApiManage:edit")
	@RequestMapping(value = "start")
	public String start(TagApiManage tagApiManage, RedirectAttributes redirectAttributes) {
		tagApiManageService.startTagApiManage(tagApiManage);
		addMessage(redirectAttributes, "启用成功");
		return "redirect:" + adminPath + "/apiam/tagApiManage/list?repage";
	}
	
	@RequiresPermissions("apiam:tagApiManage:edit")
	@RequestMapping(value = "pause")
	public String pause(TagApiManage tagApiManage, RedirectAttributes redirectAttributes) {
		tagApiManageService.pauseTagApiManage(tagApiManage);
		addMessage(redirectAttributes, "暂停成功");
		return "redirect:" + adminPath + "/apiam/tagApiManage/list?repage";
	}
	
	@RequiresPermissions("apiam:tagApiManage:edit")
	@RequestMapping(value = "delete")
	public String delete(TagApiManage tagApiManage, RedirectAttributes redirectAttributes) {
		tagApiManageService.deleteTagApiManage(tagApiManage);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + adminPath + "/apiam/tagApiManage/list?repage";
	}
}
