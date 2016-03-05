package com.dao;

import java.util.List;

import com.model.Photos;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface PhotosDao {

	void save(Photos photos);

	Results Listpages(Page page);

	void delete(Photos photos);

	void update(Photos photos);

	Photos query(Photos photos);

	List<Photos> List();

	Photos queryby(int photosId);

	Results Listbypageid(Page page, int id);

	List<Photos> ListbyUid(int id);

}
