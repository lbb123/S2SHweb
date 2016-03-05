package com.dao;

import com.model.Goods;
import com.util.Page;
import com.util.Results;

public interface GoodsDao {

	void save(Goods goods);

	Results Listpages(Page page);

	void delete(Goods goods);

	Goods querybyid(int gid);

	void update(Goods goods);



}
