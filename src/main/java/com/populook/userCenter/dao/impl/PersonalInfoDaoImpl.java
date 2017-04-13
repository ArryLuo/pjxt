package com.populook.userCenter.dao.impl;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Component;

import com.populook.framework.dao.impl.BaseDaoSupport;
import com.populook.system.entity.Operator;
import com.populook.userCenter.dao.PersonalInfoDao;
@Component("personalInfoDao")
public class PersonalInfoDaoImpl extends BaseDaoSupport implements PersonalInfoDao {

	@Resource
	 private SqlSessionFactory sqlSessionFactory;
	
	 @PostConstruct
	 public void initSqlMapClient() {
	 super.setSqlSessionFactory(sqlSessionFactory);
	 }
	
	 protected SqlSessionFactory getSqlSessionFactory(){
	 return this.sqlSessionFactory;
	 }
	@Override
	public void updatePersonalInfo(Operator operator) {
		this.getSqlSession().update("OperatorMapper.updateOperator", operator);

	}

	@Override
	public Operator infoByID(String id) {
		
		return this.getSqlSession().selectOne("OperatorMapper.selectone", id);
	}

}
