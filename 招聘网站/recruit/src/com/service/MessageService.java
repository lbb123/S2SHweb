package com.service;

import com.model.Message;
import com.util.Page;
import com.util.Results;

public interface MessageService {

	void save(Message message);

	Results messageList(Page page);

	void delete(Message message);

	Message querybyid(int id);

	void update(Message queryMessage);

	Results messageListbyuid(Page page, int id);

	Results messageListbycid(Page page, int id);

}
