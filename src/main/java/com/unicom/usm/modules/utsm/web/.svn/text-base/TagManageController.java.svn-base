package com.unicom.usm.modules.utsm.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.unicom.usm.common.persistence.Page;
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.common.web.BaseController;
import com.unicom.usm.modules.sys.utils.UserUtils;
import com.unicom.usm.modules.utsm.entity.TagManage;
import com.unicom.usm.modules.utsm.service.TagManageService;

/**
 * 标签管理Controller
 * @author vision
 *
 */

@Controller
@RequestMapping(value = "${adminPath}/utsm/tagManage")
public class TagManageController extends BaseController{

	@Autowired
	private TagManageService tagManageService;
	
	@ModelAttribute("tagManage")
	public TagManage get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return tagManageService.get(id);
		}else{
			return new TagManage();
		}
	}
	
	@RequiresPermissions("utsm:tagManage:view")
	@RequestMapping(value = {"index"})
	public String index(TagManage tagManage, Model model) {
		return "modules/utsm/tagManageIndex";
	}

	@RequiresPermissions("utsm:tagManage:view")
	@RequestMapping(value = {"list", ""})
	public String list(TagManage tagManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TagManage> page = tagManageService.findTagManage(new Page<TagManage>(request, response), tagManage);
        model.addAttribute("page", page);
		return "modules/utsm/tagManageList";
	}
	
	@ResponseBody
	@RequiresPermissions("utsm:tagManage:view")
	@RequestMapping(value = {"listData"})
	public Page<TagManage> listData(TagManage tagManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TagManage> page = tagManageService.findTagManage(new Page<TagManage>(request, response), tagManage);
		return page;
	}
	
	@RequiresPermissions("utsm:tagManage:view")
	@RequestMapping(value = "form")
	public String form(TagManage tagManage, Model model) {
		if (tagManage.getTagClassify()==null || tagManage.getTagClassify().getId()==null){
			tagManage.setTagClassify(UserUtils.getUser().getTagClassify());
		}
		
		model.addAttribute("tagManage", tagManage);
		//model.addAttribute("allRoles", systemService.findAllRole());
		return "modules/utsm/tagManageForm";
	}

	@RequiresPermissions("utsm:tagManage:edit")
	@RequestMapping(value = "save")
	public String save(TagManage tagManage, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		
		tagManage.setCategoryId(request.getParameter("tagClassify.id"));
		tagManage.setCreateTime(new Date());
		tagManage.setTagStatus("00");
		if (!beanValidator(model, tagManage)){
			return form(tagManage, model);
		}
		// 保存信息
		tagManageService.saveTagManage(tagManage);
		addMessage(redirectAttributes, "保存标签'" + tagManage.getTag() + "'成功");
		return "redirect:" + adminPath + "/utsm/tagManage/list?repage";
	}
	
	/**
	 * 信息显示及保存
	 * @param user
	 * @param model
	 * @return
	 */
	/*@RequiresPermissions("utsm:tagManage:view")
	@RequestMapping(value = "edit")*/
	/*@RequiresPermissions("tagManage")
	@RequestMapping(value = "info")*/
	/*public String update(TagManage tagManage, HttpServletRequest request, Model model) {
		TagManage tm = new TagManage();
		tm.setId(request.getParameter("id"));
		tm.setCategoryId(tagManage.getTagClassify().getId());
		tm.setComment(tagManage.getComment());
		tm.setConnectFilePath(tagManage.getConnectFilePath());
		tm.setConnect_ip(tagManage.getConnect_ip());
		tm.setConnectIp(tagManage.getConnectIp());
		tm.setConnectPassword(tagManage.getConnectPassword());
		tm.setConnectPort(tagManage.getConnectPort());
		tm.setConnectType(tagManage.getConnectType());
		tm.setConnectUser(tagManage.getConnectUser());
		tm.setDayTagNameRule(tagManage.getDayTagNameRule());
		tm.setMonthTagNameRule(tagManage.getMonthTagNameRule());
		tm.setTag(tagManage.getTag());
		tm.setTagStatus(tagManage.getTagStatus());
		tm.setTagColumnLength(tagManage.getTagColumnLength());
		tm.setTagColumnDatatype(tagManage.getTagColumnDatatype());
		tm.setTagColumnName(tagManage.getTagColumnName());
		tm.setTagShowName(tagManage.getTagShowName());
		tm.setUpdateType(tagManage.getUpdateType());
		tm.setSynchroType(tagManage.getSynchroType());
		
		tagManageService.update(tm);
		
		model.addAttribute("message", "保存信息成功");
		model.addAttribute("tagManage", tm);
		return "modules/utsm/tagManage/list?repage";
		//return "redirect:" + adminPath + "/utsm/tagManage/list?repage";
	}*/
	
	@RequiresPermissions("utsm:tagManage:edit")
	@RequestMapping(value = "start")
	public String start(TagManage tagManage, RedirectAttributes redirectAttributes) {
		tagManageService.startTagManage(tagManage);
		addMessage(redirectAttributes, "启用标签成功");
		return "redirect:" + adminPath + "/utsm/tagManage/list?repage";
	}
	
	@RequiresPermissions("utsm:tagManage:edit")
	@RequestMapping(value = "pause")
	public String pause(TagManage tagManage, RedirectAttributes redirectAttributes) {
		tagManageService.pauseTagManage(tagManage);
		addMessage(redirectAttributes, "暂停标签成功");
		return "redirect:" + adminPath + "/utsm/tagManage/list?repage";
	}
	
	
	@RequiresPermissions("utsm:tagManage:edit")
	@RequestMapping(value = "delete")
	public String delete(TagManage tagManage, RedirectAttributes redirectAttributes) {
		tagManageService.deleteTagManage(tagManage);
		addMessage(redirectAttributes, "删除标签成功");
		return "redirect:" + adminPath + "/utsm/tagManage/list?repage";
	}
	
	/*@RequiresPermissions("user")*/
	@RequiresPermissions("utsm:tagManage:view")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String tagManageId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<TagManage> list = tagManageService.findUserByTagManageId(tagManageId);
		for (int i=0; i<list.size(); i++){
			TagManage e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id",  e.getId());
			map.put("pId", tagManageId);
			map.put("name", StringUtils.replace(e.getTag(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}
	
	
	
	
	
	
}
