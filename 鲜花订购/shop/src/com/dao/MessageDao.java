package com.dao;

import com.model.Message;
import com.model.Reply;
import com.util.Page;
import com.util.Results;

public interface MessageDao {

	void save(Message message);

	Results listpage(Page page);

	void delete(Message message);

	Results replylist(Page page, int mid);

	Message querymessage(int mid);

	void savereply(Reply reply);

	Results messagelistuser(Page page, int id);

}
