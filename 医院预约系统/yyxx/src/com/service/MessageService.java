package com.service;

import com.model.Message;
import com.model.Reply;
import com.util.Page;
import com.util.Results;

public interface MessageService {

	void save(Message message);

	Results messagelist(Page page);

	void delete(Message message);

	Results replylist(Page page, int mid);

	Message querymessage(int mid);

	void savereply(Reply reply);

	Results messagelistuser(Page page, int id);

	Results messagelistDoctor(Page page, int did);

}
