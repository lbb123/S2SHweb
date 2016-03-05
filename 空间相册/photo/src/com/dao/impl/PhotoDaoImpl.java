package com.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.dao.PhotoDao;
import com.dao.UserDao;
import com.model.Photo;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("photoDao")
public class PhotoDaoImpl extends MyHibernateDaoSupport implements PhotoDao {

	public void add(Photo photo) {
		this.getHibernateTemplate().save(photo);
		
	}

	public List<Photo> Listby(Photo photo) {
		String hql = "from Photo photo where photo.photosId='"
			+ photo.getPhotosId()+"'";
		return this.getHibernateTemplate().find(hql);
	}

	public List<Photo> ListbyPId(int i) {
		String hql = "from Photo photo where photo.photosId='"
			+ i+"'";
		return this.getHibernateTemplate().find(hql);
	}

	public void delete(Photo photo) {
		this.getHibernateTemplate().delete(photo);
		
	}

	public void update(Photo photo) {
		this.getHibernateTemplate().update(photo);
		
	}

	public Photo query(Photo photo) {
		String hql = "from Photo photo where photo.id='"
			+ photo.getId()+"'";
	List list = this.getHibernateTemplate().find(hql);
	return (Photo) list.get(0);
	}


}
