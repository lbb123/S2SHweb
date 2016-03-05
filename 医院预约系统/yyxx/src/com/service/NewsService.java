package com.service;

import com.model.News;
import com.util.Page;
import com.util.Results;

public interface NewsService {

	void save(News news);

	Results companylist(Page page);

	News querybyid(int nid);

	void update(News news);

	void delete(News news);

}
