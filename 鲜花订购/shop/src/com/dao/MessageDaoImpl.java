package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Admin;
import com.model.Message;
import com.model.Reply;
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

	//列表
	@SuppressWarnings("unchecked")
	public Results listpage(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
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

	//删除
	public void delete(Message message) {
		this.getHibernateTemplate().delete(message);
	}

	//回复列表
	@SuppressWarnings("unchecked")
	public Results replylist(Page page, final int mid) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Reply r where r.mid='" + mid + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Reply r where r.mid='" + mid
										+ "' order by id desc");
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

	//消息
	public Message querymessage(int mid) {
		String hql = "from Message m where m.mid='" + mid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Message) list.get(0);
	}

	//添加回复
	public void savereply(Reply reply) {
		this.getHibernateTemplate().save(reply);
	}

	//查询留言
	@SuppressWarnings("unchecked")
	public Results messagelistuser(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message m where m.uid='" + id + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
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

}
