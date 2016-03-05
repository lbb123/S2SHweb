package com.dao;

import com.model.Message;
import com.util.Page;
import com.util.Results;

public interface MessageDao {

	void save(Message message);

	Results Listpages(Page page);

	void delete(Message message);

	Message querybyid(int id);

	void update(Message message);

	Results Listpagesbyuid(Page page, int id);

	Results messageListbycid(Page page, int id);

}
