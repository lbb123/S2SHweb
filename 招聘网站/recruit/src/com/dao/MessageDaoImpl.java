package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Message;
import com.model.Resume;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("messageDao")
public class MessageDaoImpl extends MyHibernateDaoSupport implements MessageDao {

	// 添加
	public void save(Message message) {
		this.getHibernateTemplate().save(message);
	}

	// 投递列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message  order by id desc");
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

	// 删除投递信息
	public void delete(Message message) {
		this.getHibernateTemplate().delete(message);
	}

	// 查询
	public Message querybyid(int id) {
		String hql = "from Message message where message.id='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Message) list.get(0);
	}

	// 修改
	public void update(Message message) {
		this.getHibernateTemplate().update(message);
	}

	//某用户投递信息
	@SuppressWarnings("unchecked")
	public Results Listpagesbyuid(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message message where message.uid="+id+"");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message message where message.uid="+id+" order by message.id desc");
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

	//某公司投递信息
	@SuppressWarnings("unchecked")
	public Results messageListbycid(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message message where message.cid="+id+"");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message message where message.cid="+id+" order by message.id desc");
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
