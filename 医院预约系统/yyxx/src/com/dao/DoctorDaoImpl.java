package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Discuss;
import com.model.Doctor;
import com.model.Reply;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("doctorDao")
public class DoctorDaoImpl extends MyHibernateDaoSupport implements DoctorDao {

	// 医生登录
	public Doctor logins(Doctor doctor) {
		String hql = "from Doctor d where d.name='" + doctor.getName()
				+ "' and d.password='" + doctor.getPassword() + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Doctor) list.get(0);
	}

	// 医生信息查询
	public Doctor querybyid(int id) {
		String hql = "from Doctor d where d.did='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Doctor) list.get(0);
	}

	// 修改医生信息
	public void update(Doctor doctor) {
		this.getHibernateTemplate().update(doctor);
	}

	// 医生信息列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Doctor");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Doctor  order by id desc");
						// 设置每页显示多少个，设置多大结果。
						query.setMaxResults(page2.getEveryPage());
						// 设置起点
						query.setFirstResult(page2.getBeginIndex());
						return query.list();
					}

				});
		Results result = new Results();
		result.setPage(page2);
		result.setList(all);
		return result;
	}

	// 删除医生信息
	public void delete(Doctor doctor) {
		this.getHibernateTemplate().delete(doctor);
	}

	// 添加医生信息
	public void save(Doctor doctor) {
		this.getHibernateTemplate().save(doctor);
	}

	// 医生信息详情
	@SuppressWarnings("unchecked")
	public Results queryDiscuss(Page page, final int did) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Discuss d where d.did='" + did + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Discuss> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Discuss d where d.did='"
										+ did + "' order by id desc");
						// 设置每页显示多少个，设置多大结果。
						query.setMaxResults(page2.getEveryPage());
						// 设置起点
						query.setFirstResult(page2.getBeginIndex());
						return query.list();
					}

				});
		Results result = new Results();
		result.setPage(page2);
		result.setList(all);
		return result;
	}

	// 评论添加
	public void savediscuss(Discuss discuss) {
		this.getHibernateTemplate().save(discuss);
	}

	// 评论列表
	@SuppressWarnings("unchecked")
	public Results queryDiscusslist(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Discuss");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Discuss> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Discuss  order by id desc");
						// 设置每页显示多少个，设置多大结果。
						query.setMaxResults(page2.getEveryPage());
						// 设置起点
						query.setFirstResult(page2.getBeginIndex());
						return query.list();
					}

				});
		Results result = new Results();
		result.setPage(page2);
		result.setList(all);
		return result;
	}

	// 评论删除
	public void deletediscuss(Discuss discuss) {
		this.getHibernateTemplate().delete(discuss);
	}

}
