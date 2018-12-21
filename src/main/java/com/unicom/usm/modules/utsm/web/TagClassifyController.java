package com.unicom.usm.modules.utsm.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.common.web.BaseController;
import com.unicom.usm.modules.sys.entity.User;
import com.unicom.usm.modules.sys.utils.DictUtils;
import com.unicom.usm.modules.sys.utils.UserUtils;
import com.unicom.usm.modules.utsm.entity.TagClassify;
import com.unicom.usm.modules.utsm.service.TagClassifyService;

/**
 * 标签分类Controller
 * @author vision
 *
 */

@Controller
@RequestMapping(value = "${adminPath}/utsm/tagClassify")
public class TagClassifyController extends BaseController{
	
	@Autowired
	private TagClassifyService tagClassifyService;
	
	@ModelAttribute("tagClassify")
	public TagClassify get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return tagClassifyService.get(id);
		}else{
			return new TagClassify();
		}
	}

	@RequiresPermissions("utsm:tagClassify:view")
	@RequestMapping(value = {""})
	public String index(TagClassify tagClassify, Model model) {
		return "modules/utsm/tagClassifyIndex";
	}

	@RequiresPermissions("utsm:tagClassify:view")
	@RequestMapping(value = {"list"})
	public String list(TagClassify tagClassify, Model model) {
        model.addAttribute("list", tagClassifyService.findList(tagClassify));
		return "modules/utsm/tagClassifyList";
	}
	
	@RequiresPermissions("utsm:tagClassify:view")
	@RequestMapping(value = "form")
	public String form(TagClassify tagClassify, Model model) {
		User user = UserUtils.getUser();
		if (tagClassify.getParent()==null || tagClassify.getParent().getId()==null){
			tagClassify.setParent(user.getTagClassify());
		}
		tagClassify.setParent(tagClassifyService.get(tagClassify.getParent().getId()));
		
		// 自动获取排序号
		if (StringUtils.isBlank(tagClassify.getId())&&tagClassify.getParent()!=null){
			int size = 0;
			List<TagClassify> list = tagClassifyService.findAll();
			for (int i=0; i<list.size(); i++){
				TagClassify e = list.get(i);
				if (e.getParent()!=null && e.getParent().getId()!=null
						&& e.getParent().getId().equals(tagClassify.getParent().getId())){
					size++;
				}
			}
			//tagClassify.setCode(tagClassify.getParent().getCode() + StringUtils.leftPad(String.valueOf(size > 0 ? size+1 : 1), 3, "0"));
		}
		model.addAttribute("tagClassify", tagClassify);
		return "modules/utsm/tagClassifyForm";
	}
	
	@RequiresPermissions("utsm:tagClassify:edit")
	@RequestMapping(value = "save")
	public String save(TagClassify tagClassify, Model model, RedirectAttributes redirectAttributes) {
		
		if (!beanValidator(model, tagClassify)){
			return form(tagClassify, model);
		}
		tagClassifyService.save(tagClassify);
		
		if(tagClassify.getChildClassifyList()!=null){
			TagClassify childTagClassify = null;
			for(String id : tagClassify.getChildClassifyList()){
				childTagClassify = new TagClassify();
				childTagClassify.setCreateTime(new Date());
				childTagClassify.setName(DictUtils.getDictLabel(id, "sys_tagClassify_common", "未知"));
				childTagClassify.setParent(tagClassify);
				childTagClassify.setType("2");
				tagClassifyService.save(childTagClassify);
			}
		}
		
		addMessage(redirectAttributes, "保存分类'" + tagClassify.getCategory() + "'成功");
		String id = "0".equals(tagClassify.getParentId()) ? "" : tagClassify.getParentId();
		return "redirect:" + adminPath + "/utsm/tagClassify/list?id="+id+"&parentIds="+tagClassify.getParentIds();
	}
	
	@RequiresPermissions("utsm:tagClassify:edit")
	@RequestMapping(value = "delete")
	public String delete(TagClassify tagClassify, RedirectAttributes redirectAttributes) {
		tagClassifyService.delete(tagClassify);
		addMessage(redirectAttributes, "删除分类成功");
		return "redirect:" + adminPath + "/utsm/tagClassify/list?id="+tagClassify.getParentId()+"&parentIds="+tagClassify.getParentIds();
	}

	/**
	 * 获取机构JSON数据。
	 * @param extId 排除的ID
	 * @param response
	 * @return
	 */
	@RequiresPermissions("utsm:tagClassify:view")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, @RequestParam(required=false) String type,
			@RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<TagClassify> list = tagClassifyService.findList(isAll);
		for (int i=0; i<list.size(); i++){
			TagClassify e = list.get(i);
			if ((StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) 
					&& e.getParentIds().indexOf(","+extId+",")==-1))
					&& (type == null || (type != null && (type.equals("1") ? type.equals(e.getType()) : true)))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getCategory());
				if (type != null && "3".equals(type)){
					map.put("isParent", true);
				}
				mapList.add(map);
			}
		}
		return mapList;
	}
}
