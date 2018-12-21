package com.unicom.usm.modules.us.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicom.usm.common.service.CrudService;
import com.unicom.usm.modules.us.dao.UserSearchDao;
import com.unicom.usm.modules.us.entity.UserSearch;

@Service
@Transactional(readOnly = true)
public class UserSearchService extends CrudService<UserSearchDao, UserSearch>{

	@Autowired
	private UserSearchDao userSearchDao;
}
