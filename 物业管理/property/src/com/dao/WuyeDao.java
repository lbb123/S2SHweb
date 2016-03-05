package com.dao;

import com.model.User;
import com.model.Wuye;
import com.util.Page;
import com.util.Results;

public interface WuyeDao {

	void save(Wuye wuye);

	Results Listpages(Page page);

	Wuye querybyid(int id);

	void update(Wuye wuye);

	void delete(Wuye wuye);

	User queryuser(int uid);

	Results userwuyelist(Page page, int id);


}
