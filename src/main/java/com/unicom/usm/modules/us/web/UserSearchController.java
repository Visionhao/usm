package com.unicom.usm.modules.us.web;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.common.web.BaseController;
import com.unicom.usm.modules.us.entity.UserSearch;
import com.unicom.usm.modules.us.service.UserSearchService;

@Controller
@RequestMapping(value = "${adminPath}/us/userSearch")
public class UserSearchController extends BaseController{
	
	@Autowired
	private UserSearchService userSearchService;
	
	@ModelAttribute("userSearch")
	public UserSearch get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return userSearchService.get(id);
		}else{
			return new UserSearch();
		}
	}
	
	@RequiresPermissions("us:userSearch:view")
	@RequestMapping(value = {"index"})
	public String index(UserSearch userSearch, Model model) {
		return "modules/us/userSearchIndex";
	}

}
