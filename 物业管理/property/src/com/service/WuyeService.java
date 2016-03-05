package com.service;

import com.model.User;
import com.model.Wuye;
import com.util.Page;
import com.util.Results;

public interface WuyeService {

	void save(Wuye wuye);

	Results companylist(Page page);

	User queryuser(int uid);

	Wuye querybyid(int wid);

	void update(Wuye wuye);

	void delete(Wuye wuye);

	Results userwuyelist(Page page, int id);

}
