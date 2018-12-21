package com.unicom.usm.modules.apiam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.modules.apiam.dao.RecommendEffectTestDao;
import com.unicom.usm.modules.apiam.entity.RecommendEffectTest;

@Service
@Transactional(readOnly = true)
public class RecommendEffectTestService extends CrudService<RecommendEffectTestDao, RecommendEffectTest>{

	@Autowired
	private RecommendEffectTestDao recommendEffectTestDao;
}
