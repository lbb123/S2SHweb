package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Resume;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("resumeDao")
public class ResumeDaoImpl extends MyHibernateDaoSupport implements ResumeDao {

	// 简历添加
	public void save(Resume resume) {
		this.getHibernateTemplate().save(resume);
	}

	// 简历分页列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Resume");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Resume  order by id desc");
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

	// 简历删除
	public void delete(Resume resume) {
		this.getHibernateTemplate().delete(resume);

	}

	// 简历查询
	public Resume queryby(int id) {
		String hql = "from Resume resume where resume.id='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Resume) list.get(0);
	}

	// 简历修改
	public void update(Resume resume) {
		this.getHibernateTemplate().update(resume);
	}

	// 简历不分页列表
	public List<Resume> queryall() {
		String hql = "from Resume resume ";
		return this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public Results Listpageby(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Resume resume where resume.uid="+id+"");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Resume resume where resume.uid="+id+" order by resume.id desc");
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

	public List<Resume> querybyuid(int id) {
		String hql = "from Resume resume where resume.uid='" + id + "'";
		return this.getHibernateTemplate().find(hql);
	}

}
