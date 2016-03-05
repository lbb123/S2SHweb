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

import com.model.Admin;
import com.model.Catelog;
import com.model.Message;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("messageDao")
public class MessageDaoImpl extends MyHibernateDaoSupport implements MessageDao {

	// 添加民意信息
	public void save(Message message) {
		this.getHibernateTemplate().save(message);
	}

	// 民意信息列表
	@SuppressWarnings("unchecked")
	public Results listpage(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Message> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message order by id desc");
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

	// 民意信息删除
	public void delete(Message message) {
		this.getHibernateTemplate().delete(message);
	}

	// 民意信息查询
	public Message querymessage(int mid) {
		String hql = "from Message m where m.mid='" + mid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Message) list.get(0);
	}

	// 民意信息列表
	@SuppressWarnings("unchecked")
	public Results messagelistuser(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message m where m.uid='" + id + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Message> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message m where m.uid='"
										+ id + "' order by id desc");
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

	// 民意信息列表查询
	@SuppressWarnings("unchecked")
	public Results messagelistDoctor(Page page, final int did) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message m where m.did='" + did + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Message> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message m where m.did='"
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

	// 查询分类信息
	public Catelog queryCatelog(int cid) {
		String hql = "from Catelog c where c.cid='" + cid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Catelog) list.get(0);
	}

	// 修改民意
	public void update(Message message) {
		this.getHibernateTemplate().update(message);
	}

	// 查询民意类型的列表
	@SuppressWarnings("unchecked")
	public Results messagelistmtype(Page page, final String mtype) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message m where m.mtype='" + mtype + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Message> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message m where m.mtype='"
										+ mtype + "' order by id desc");
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

	// 查询用户
	public User queryUser(int msendid) {
		String hql = "from User u where u.id='" + msendid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (User) list.get(0);
	}

	// 查询列表
	@SuppressWarnings("unchecked")
	public Results messagelistmsendid(Page page, final int msendid) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message m where m.msendid='" + msendid
						+ "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Message> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message m where m.msendid='"
										+ msendid + "' order by id desc");
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

	//模糊组合查询
	@SuppressWarnings("unchecked")
	public Results queryallmessage(Page page, final Message message) {
		int count = 0; 
		List list = (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria c = session.createCriteria(Message.class);
				c.add(Restrictions.eq("mtype", "已采用"));
				if (message.getMtitle()!= null &&!message.getMtitle().equals("")) {
					c.add( Restrictions.like("mtitle", "%"+message.getMtitle()+"%"));
				}
				if (message.getMsendname()!= null &&!message.getMsendname().equals("")) {
					c.add( Restrictions.like("msendname", "%"+message.getMsendname()+"%"));// eq是等于，gt是大于，lt是小于,or是或
				}
				if (message.getMcatelog()!= null &&!message.getMcatelog().equals("")) {
					c.add( Restrictions.like("mcatelog", "%"+message.getMcatelog()+"%"));// eq是等于，gt是大于，lt是小于,or是或
				}
				if (message.getMfenshudate()!= null &&!message.getMfenshudate().equals("")) {
					c.add( Restrictions.like("mfenshudate", "%"+message.getMfenshudate()+"%"));// eq是等于，gt是大于，lt是小于,or是或
				}
				return c.list();
			}
		});
		   if (list.size() > 0) {
		count = (Integer) list.size();
		}
		page = PageUtil.createPage(page, count);
		final Page page2 = page;
		List<User> all =(List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria c = session.createCriteria(Message.class);
				c.add(Restrictions.eq("mtype", "已采用"));
				if (message.getMtitle()!= null &&!message.getMtitle().equals("")) {
					c.add( Restrictions.like("mtitle", "%"+message.getMtitle()+"%"));
				}
				if (message.getMsendname()!= null &&!message.getMsendname().equals("")) {
					c.add( Restrictions.like("msendname", "%"+message.getMsendname()+"%"));// eq是等于，gt是大于，lt是小于,or是或
				}
				if (message.getMcatelog()!= null &&!message.getMcatelog().equals("")) {
					c.add( Restrictions.like("mcatelog", "%"+message.getMcatelog()+"%"));// eq是等于，gt是大于，lt是小于,or是或
				}
				if (message.getMfenshudate()!= null &&!message.getMfenshudate().equals("")) {
					c.add( Restrictions.like("mfenshudate", "%"+message.getMfenshudate()+"%"));// eq是等于，gt是大于，lt是小于,or是或
				}
				// 设置每页显示多少个，设置多大结果。
				c.setMaxResults(page2.getEveryPage());
				//设置起点
				c.setFirstResult(page2.getBeginIndex());
				return c.list();
			}
		});
		Results result = new Results();
		result.setPage(page2);
		result.setList(all);
		return result;
	}

}
