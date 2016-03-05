package com.dao;

import com.model.Catelog;
import com.model.Message;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface MessageDao {

	void save(Message message);

	Results listpage(Page page);

	void delete(Message message);


	Message querymessage(int mid);


	Results messagelistuser(Page page, int id);

	Results messagelistDoctor(Page page, int did);

	Catelog queryCatelog(int cid);

	void update(Message message);

	Results messagelistmtype(Page page, String mtype);

	User queryUser(int msendid);

	Results messagelistmsendid(Page page, int msendid);

	Results queryallmessage(Page page, Message message);


}
