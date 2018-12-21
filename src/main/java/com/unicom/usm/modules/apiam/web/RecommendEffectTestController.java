package com.unicom.usm.modules.apiam.web;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.unicom.usm.common.utils.StringUtils;
import com.unicom.usm.common.web.BaseController;
import com.unicom.usm.modules.apiam.entity.RecommendEffectTest;
import com.unicom.usm.modules.apiam.service.RecommendEffectTestService;

@Controller
@RequestMapping(value = "${adminPath}/apiam/recommendEffectTest")
public class RecommendEffectTestController extends BaseController{
	
	@Autowired
	private RecommendEffectTestService recommendEffectTestService;
	
	@ModelAttribute("recommendEffectTest")
	public RecommendEffectTest get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return recommendEffectTestService.get(id);
		}else{
			return new RecommendEffectTest();
		}
	}
	
	@RequiresPermissions("apiam:recommendEffectTest:view")
	@RequestMapping(value = {"index"})
	public String index(RecommendEffectTest recommendEffectTest, Model model) {
		return "modules/apiam/recommendEffectTestIndex";
	}

}
