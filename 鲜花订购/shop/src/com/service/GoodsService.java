package com.service;

import com.model.Goods;
import com.util.Page;
import com.util.Results;

public interface GoodsService {

	void save(Goods goods);


	Results list(Page page);


	void delete(Goods goods);


	void update(Goods goods);


	Goods querybyid(int gid);


	String querycid(int cid);


	Results querygoodslist(Page page, Goods goods);

}
