package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.PhotosDao;
import com.dao.UserDao;
import com.model.Photos;
import com.model.User;
import com.service.PhotosService;
import com.service.UserService;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Service 
public class PhotosServiceImpl implements PhotosService {

	@Resource  
    private PhotosDao photosDao;

	public void save(Photos photos) {
		photosDao.save(photos);
		
	}

	public Results Listbypage(Page page) {
		return photosDao.Listpages(page);
	}

	public void delete(Photos photos) {
		photosDao.delete(photos);  
		
	}

	public void update(Photos photos) {
		photosDao.update(photos);  
		
	}

	public Photos query(Photos photos) {
		// TODO Auto-generated method stub
		return photosDao.query(photos); 
	}

	public List<Photos> List() {
		return photosDao.List();
	}

	public Photos queryby(int photosId) {
		return photosDao.queryby(photosId); 
	}

	public Results Listbypageid(Page page, int id) {
		return photosDao.Listbypageid(page,id);
	}

	public List<Photos> ListbyUid(int id) {
		return photosDao.ListbyUid(id);
	}  
	



}
