package com.service;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;

import com.model.Photos;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface PhotosService {

	void save(Photos photos);

	Results Listbypage(Page page);

	void delete(Photos photos);

	void update(Photos photos);

	Photos query(Photos photos);

	List<Photos> List();

	Photos queryby(int photosId);

	Results Listbypageid(Page page, int id);

	List<Photos> ListbyUid(int id);

}
