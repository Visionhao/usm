package com.unicom.usm.modules.utsm.web;

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

import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.common.web.BaseController;
import com.unicom.usm.modules.utsm.entity.TagSynchroManage;
import com.unicom.usm.modules.utsm.service.TagSynchroManageService;

@Controller
@RequestMapping(value = "${adminPath}/utsm/tagSynchroManage")
public class TagSynchroManageController extends BaseController{

	@Autowired
	private TagSynchroManageService tagSynchroManageService;
	
	@ModelAttribute("tagSynchroManage")
	public TagSynchroManage get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return tagSynchroManageService.get(id);
		}else{
			return new TagSynchroManage();
		}
	}
	
	@RequiresPermissions("utsm:tagSynchroManage:view")
	@RequestMapping(value = {"list", ""})
	public String list(TagSynchroManage tagSynchroManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TagSynchroManage> page = tagSynchroManageService.findTagSynchroManage(new Page<TagSynchroManage>(request, response), tagSynchroManage);
        model.addAttribute("page", page);
		return "modules/utsm/tagSynchroManageList";
	}
	
	@ResponseBody
	@RequiresPermissions("utsm:tagSynchroManage:view")
	@RequestMapping(value = {"listData"})
	public Page<TagSynchroManage> listData(TagSynchroManage tagSynchroManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TagSynchroManage> page = tagSynchroManageService.findTagSynchroManage(new Page<TagSynchroManage>(request, response), tagSynchroManage);
		return page;
	}
}
