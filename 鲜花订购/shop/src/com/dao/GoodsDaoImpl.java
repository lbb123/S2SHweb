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

import com.model.Catelog;
import com.model.Goods;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("goodsDao")
public class GoodsDaoImpl extends MyHibernateDaoSupport implements GoodsDao {

	// 列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Goods g ");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Goods g  order by id desc");
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
	//查询
	public Goods querybyid(int gid) {
		String hql = "from Goods g where g.gid='" + gid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Goods) list.get(0);
	}

	//修改
	public void update(Goods goods) {
		this.getHibernateTemplate().update(goods);
	}

	//删除
	public void delete(Goods goods) {
		this.getHibernateTemplate().delete(goods);
	}

	// 添加
	public void save(Goods goods) {
		this.getHibernateTemplate().save(goods);
	}
	//查询类别
	public String querycid(int cid) {
		String hql = "from Catelog c where c.cid='" + cid + "'";
		List list = this.getHibernateTemplate().find(hql);
		Catelog c= (Catelog) list.get(0);
		return c.getCname();
	}
	//模糊查询
	@SuppressWarnings("unchecked")
	public Results querygoodslist(Page page, final Goods goods) {
		int count = 0; 
		List list = (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria c = session.createCriteria(Goods.class);
				if (goods.getGname()!= null &&!goods.getGname().equals("")) {
					c.add( Restrictions.like("gname", "%"+goods.getGname()+"%"));
				}
				if (goods.getCid()!= 0) {
					c.add(Restrictions.eq("cid", goods.getCid()));// eq是等于，gt是大于，lt是小于,or是或
				}
				if (goods.getGtype()!= null && !goods.getGtype().equals("")) {
					c.add(Restrictions.eq("gtype", goods.getGtype()));// eq是等于，gt是大于，lt是小于,or是或
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
				Criteria c = session.createCriteria(Goods.class);
				if (goods.getGname()!= null &&!goods.getGname().equals("")) {
					c.add( Restrictions.like("gname", "%"+goods.getGname()+"%"));
				}
				if (goods.getCid()!= 0) {
					c.add(Restrictions.eq("cid", goods.getCid()));// eq是等于，gt是大于，lt是小于,or是或
				}
				if (goods.getGtype()!= null && !goods.getGtype().equals("")) {
					c.add(Restrictions.eq("gtype", goods.getGtype()));// eq是等于，gt是大于，lt是小于,or是或
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
