package com.dao;

import java.util.List;

import com.model.Photo;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface PhotoDao {

	void add(Photo photo);

	List<Photo> Listby(Photo photo);

	List<Photo> ListbyPId(int i);

	void delete(Photo photo);

	void update(Photo photo);

	Photo query(Photo photo);
	

}
