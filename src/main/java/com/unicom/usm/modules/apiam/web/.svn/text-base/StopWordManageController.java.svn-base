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
import com.unicom.usm.modules.apiam.entity.StopWordManage;
import com.unicom.usm.modules.apiam.service.StopWordManageService;

/**
 * 停用词管理controller
 * @author vision
 *
 */

@Controller
@RequestMapping(value = "${adminPath}/apiam/stopWordManage")
public class StopWordManageController extends BaseController{

	@Autowired
	private StopWordManageService stopWordManageService;
	
	@ModelAttribute("stopWordManage")
	public StopWordManage get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return stopWordManageService.get(id);
		}else{
			return new StopWordManage();
		}
	}

	@RequiresPermissions("apiam:stopWordManage:view")
	@RequestMapping(value = {"list", ""})
	public String list(StopWordManage stopWordManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StopWordManage> page = stopWordManageService.findStopWordManage(new Page<StopWordManage>(request, response), stopWordManage);
        model.addAttribute("page", page);
		return "modules/apiam/stopWordManageList";
	}
	
	@ResponseBody
	@RequiresPermissions("apiam:stopWordManage:view")
	@RequestMapping(value = {"listData"})
	public Page<StopWordManage> listData(StopWordManage stopWordManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StopWordManage> page = stopWordManageService.findStopWordManage(new Page<StopWordManage>(request, response), stopWordManage);
		return page;
	}
	
	@RequiresPermissions("apiam:stopWordManage:view")
	@RequestMapping(value = "form")
	public String form(StopWordManage stopWordManage, Model model) {
		model.addAttribute("stopWordManage", stopWordManage);
		//model.addAttribute("allRoles", systemService.findAllRole());
		return "modules/apiam/stopWordManageForm";
	}

	@RequiresPermissions("apiam:stopWordManage:edit")
	@RequestMapping(value = "save")
	public String save(StopWordManage stopWordManage, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		stopWordManage.setCreateTime(new Date());
		if (!beanValidator(model, stopWordManage)){
			return form(stopWordManage, model);
		}
		// 保存信息
		stopWordManageService.saveStopWordManage(stopWordManage);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:" + adminPath + "/apiam/stopWordManage/list?repage";
	}
	
	@RequiresPermissions("apiam:stopWordManage:edit")
	@RequestMapping(value = "delete")
	public String delete(StopWordManage stopWordManage, RedirectAttributes redirectAttributes) {
		stopWordManageService.deleteStopWordManage(stopWordManage);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + adminPath + "/apiam/stopWordManage/list?repage";
	}
	
}
