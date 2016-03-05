package com.dao;

import com.model.Discuss;
import com.model.Doctor;
import com.util.Page;
import com.util.Results;

public interface DoctorDao {

	void save(Doctor doctor);

	void delete(Doctor doctor);

	Doctor logins(Doctor doctor);

	Doctor querybyid(int id);

	void update(Doctor doctor);

	Results Listpages(Page page);

	Results queryDiscuss(Page page, int did);

	void savediscuss(Discuss discuss);

	Results queryDiscusslist(Page page);

	void deletediscuss(Discuss discuss);


}
