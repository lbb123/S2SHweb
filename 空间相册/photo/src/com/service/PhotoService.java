package com.service;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;

import com.model.Photo;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface PhotoService {

	void save(Photo photo);

	List<Photo> Listby(Photo photo);

	List<Photo> ListbyPId(int i);

	void delete(Photo photo);

	void update(Photo photo);

	Photo query(Photo photo);

}
