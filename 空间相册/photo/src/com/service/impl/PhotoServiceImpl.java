package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.PhotoDao;
import com.dao.UserDao;
import com.model.Photo;
import com.model.User;
import com.service.PhotoService;
import com.service.UserService;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Service 
public class PhotoServiceImpl implements PhotoService {

	@Resource  
    private PhotoDao photoDao;

	public void save(Photo photo) {
		photoDao.add(photo);  
		
	}

	public List<Photo> Listby(Photo photo) {
		// TODO Auto-generated method stub
		return photoDao.Listby(photo);
	}

	public List<Photo> ListbyPId(int i) {
		return photoDao.ListbyPId(i);
	}

	public void delete(Photo photo) {
		photoDao.delete(photo);
	}

	public void update(Photo photo) {
		photoDao.update(photo);
		
	}

	public Photo query(Photo photo) {
		// TODO Auto-generated method stub
		 return photoDao.query(photo);
	}  


}
