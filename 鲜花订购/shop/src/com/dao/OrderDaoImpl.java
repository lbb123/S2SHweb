package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Catelog;
import com.model.Goods;
import com.model.Order;
import com.model.Orderitem;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("orderDao")
public class OrderDaoImpl extends MyHibernateDaoSupport implements OrderDao {

	// 列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Order o ");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Order o  order by id desc");
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

	// 查询
	public Order querybyid(int oid) {
		String hql = "from Order o where o.oid='" + oid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Order) list.get(0);
	}

	// 修改
	public void update(Order order) {
		this.getHibernateTemplate().update(order);
	}

	// 删除
	public void delete(Order order) {
		this.getHibernateTemplate().delete(order);
	}

	// 添加
	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}

	// 添加订单物品
	public void saveitem(Orderitem orderitem) {
		this.getHibernateTemplate().save(orderitem);
	}

	// 查询物品
	public Goods queryGoods(int gid) {
		String hql = "from Goods g where g.gid='" + gid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Goods) list.get(0);
	}

	// 查询分类
	public String querycatelog(int cid) {
		String hql = "from Catelog c where c.cid='" + cid + "'";
		List list = this.getHibernateTemplate().find(hql);
		Catelog c = (Catelog) list.get(0);
		return c.getCname();
	}

	// 根据订单编号查询订单
	public Order querybyobiaohao(String obiaohao) {
		String hql = "from Order o where o.obiaohao='" + obiaohao + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Order) list.get(0);
	}

	// 物品列表
	public List<Orderitem> orderitemList(int oid) {
		String hql = "from Orderitem o where o.oid='" + oid + "'";
		return this.getHibernateTemplate().find(hql);
	}

	// 修改
	public void updateGoods(Goods queryGoods) {
		this.getHibernateTemplate().update(queryGoods);
	}

	// 订单列表
	@SuppressWarnings("unchecked")
	public Results listuser(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Order o where o.uid='" + id + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Order o where o.uid='" + id
										+ "'  order by id desc");
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

	// 评论列表
	@SuppressWarnings("unchecked")
	public Results messagelistgoods(Page page, final int gid) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Message m where m.gid='" + gid + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Message m where m.gid='"
										+ gid + "'  order by id desc");
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
