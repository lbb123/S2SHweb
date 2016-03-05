package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Job;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("jobDao")
public class JobDaoImpl extends MyHibernateDaoSupport implements JobDao {

	// 添加
	public void save(Job job) {
		this.getHibernateTemplate().save(job);
	}

	// 分页列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate()
				.find("select count(*) from Job");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Job  order by id desc");
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

	// 删除
	public void delete(Job job) {
		this.getHibernateTemplate().delete(job);
	}

	public Job querybyid(int id) {
		String hql = "from Job job where job.id='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Job) list.get(0);
	}

	// 修改
	public void update(Job job) {
		this.getHibernateTemplate().update(job);
	}

	// 模糊查询
	@SuppressWarnings("unchecked")
	public List<Job> jobfind(final Job job) {
		return (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria c = session.createCriteria(Job.class);
				if (job.getName() != null && !job.getName().equals("")) {
					c.add(Restrictions.like("name", "%" + job.getName() + "%"));
				}
				if (job.getCname() != null && !job.getCname().equals("")) {
					c.add(Restrictions
							.like("cname", "%" + job.getCname() + "%"));
				}
				return c.list();
			}
		});
	}

	//某公司职位列表
	@SuppressWarnings("unchecked")
	public Results Listpagebycid(Page page, final int id) {
		List find = this.getHibernateTemplate()
				.find("select count(*) from Job job where job.cid="+id+"");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Job job where job.cid="+id+" order by job.id desc");
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

}
