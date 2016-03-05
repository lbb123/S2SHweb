package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.model.Manager;
import com.util.MyHibernateDaoSupport;

@Repository("managerDao")
public class ManagerDaoImpl extends MyHibernateDaoSupport implements ManagerDao{

	

	public Manager logins(Manager manager) {
		String hql = "from Manager manager where manager.name='"
			+ manager.getName() + "' and manager.password='"
			+ manager.getPassword() + "'";
	List list = this.getHibernateTemplate().find(hql);
	return (Manager) list.get(0);
	}

}
