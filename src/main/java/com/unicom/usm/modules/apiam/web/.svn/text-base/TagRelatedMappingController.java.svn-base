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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.common.web.BaseController;
import com.unicom.usm.modules.apiam.entity.TagRelatedMapping;
import com.unicom.usm.modules.apiam.service.TagRelatedMappingService;

/**
 * 
*
* 项目名称：usm
* 类名称：TagRelatedMappingController
* 类描述：标签相关词映射Controller
* 创建人：vision
* 创建时间：2016年12月27日 上午10:15:54
* @version
*
 */

@Controller
@RequestMapping(value = "${adminPath}/apiam/tagRelatedMapping")
public class TagRelatedMappingController extends BaseController{

	@Autowired
	private TagRelatedMappingService tagRelatedMappingService;
	
	@ModelAttribute("tagRelatedMapping")
	public TagRelatedMapping get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return tagRelatedMappingService.get(id);
		}else{
			return new TagRelatedMapping();
		}
	}
	
	@RequiresPermissions("apiam:tagRelatedMapping:view")
	@RequestMapping(value = {"index"})
	public String index(TagRelatedMapping tagRelatedMapping, Model model) {
		return "modules/apiam/tagRelatedMappingIndex";
	}
	
	@RequiresPermissions("apiam:tagRelatedMapping:view")
	@RequestMapping(value = {"list", ""})
	public String list(TagRelatedMapping tagRelatedMapping, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TagRelatedMapping> page = tagRelatedMappingService.findTagRelatedMapping(new Page<TagRelatedMapping>(request, response), tagRelatedMapping);
        model.addAttribute("page", page);
		return "modules/apiam/tagRelatedMappingList";
	}
	
	@RequiresPermissions("apiam:tagRelatedMapping:view")
	@RequestMapping(value = "form")
	public String form(TagRelatedMapping tagRelatedMapping,HttpServletRequest request, HttpServletResponse response,Model model) {
		Page<TagRelatedMapping> page = tagRelatedMappingService.findListData(new Page<TagRelatedMapping>(request, response), tagRelatedMapping);
        model.addAttribute("page", page);
		
		model.addAttribute("tagRelatedMapping", tagRelatedMapping);
		return "modules/apiam/tagRelatedMappingForm";
	}

	@RequiresPermissions("apiam:tagRelatedMapping:view")
	@RequestMapping(value = "edit")
	public String edit(TagRelatedMapping tagRelatedMapping, Model model) {
		model.addAttribute("tagRelatedMapping", tagRelatedMapping);
		return "modules/apiam/tagRelatedMappingEdit";
	}
	
	@RequiresPermissions("apiam:tagRelatedMapping:edit")
	@RequestMapping(value = "update")
	public String update(TagRelatedMapping tagRelatedMapping, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		tagRelatedMapping.setCreateTime(new Date());
		/*if (!beanValidator(model, tagRelatedMapping)){
			return form(tagRelatedMapping, model);
		}*/
		// 修改信息
		tagRelatedMappingService.updateTagRelatedMapping(tagRelatedMapping);
		addMessage(redirectAttributes, "修改成功");
		return "redirect:" + adminPath + "/apiam/tagRelatedMapping/list?repage";
	}
	
	@RequiresPermissions("apiam:tagRelatedMapping:edit")
	@RequestMapping(value = "select")
	public String saveSelect(TagRelatedMapping tagRelatedMapping, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		String temp1[] = tagRelatedMapping.getRelatedWord().split(",");
		for (int i = 0; i < temp1.length; i++) {
			tagRelatedMapping.setRelatedWord(temp1[i]);
			tagRelatedMapping.setCreateTime(new Date());
			// 保存信息
			tagRelatedMappingService.saveTagRelatedMapping(tagRelatedMapping);
		}
		
		addMessage(redirectAttributes, "保存成功");
		return "redirect:" + adminPath + "/apiam/tagRelatedMapping/list?repage";
	}
	
	@RequiresPermissions("apiam:tagRelatedMapping:edit")
	@RequestMapping(value = "save")
	public String save(TagRelatedMapping tagRelatedMapping, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		tagRelatedMapping.setCreateTime(new Date());
		// 保存信息
		tagRelatedMappingService.saveTagRelatedMapping(tagRelatedMapping);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:" + adminPath + "/apiam/tagRelatedMapping/list?repage";
	}
	
	@RequiresPermissions("utsm:tagManage:edit")
	@RequestMapping(value = "delete")
	public String delete(TagRelatedMapping tagRelatedMapping, RedirectAttributes redirectAttributes) {
		tagRelatedMappingService.deleteTagRelatedMapping(tagRelatedMapping);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + adminPath + "/apiam/tagRelatedMapping/list?repage";
	}
	
}
