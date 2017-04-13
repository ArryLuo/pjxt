package com.populook.userCenter.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.populook.system.entity.Operator;
import com.populook.userCenter.dao.PersonalInfoDao;
import com.populook.userCenter.service.PersonalInfoService;
@Component("personalInfoService")
public class PersonalInfoServiceImpl implements PersonalInfoService {
	@Resource
	private PersonalInfoDao personalInfoDao ;

	@Override
	public void updatePersonalInfo(Operator operator) {
		this.personalInfoDao.updatePersonalInfo(operator) ;

	}

	@Override
	public Operator infoByID(String id) {
	
		return this.personalInfoDao.infoByID(id);
	}

}
