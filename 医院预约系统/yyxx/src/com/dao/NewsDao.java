package com.dao;

import com.model.News;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface NewsDao {

	void save(News news);

	News querybyid(int nid);

	void update(News news);

	Results Listpages(Page page);

	void delete(News news);


}
