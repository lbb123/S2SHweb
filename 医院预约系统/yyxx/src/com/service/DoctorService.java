package com.service;

import com.model.Discuss;
import com.model.Doctor;
import com.util.Page;
import com.util.Results;

public interface DoctorService {

	void save(Doctor doctor);

	Results companylist(Page page);

	Doctor querybyid(int did);

	void update(Doctor doctor);

	void delete(Doctor doctor);

	Doctor logins(Doctor doctor);

	Results queryDiscuss(Page page, int did);

	void savediscuss(Discuss discuss);

	Results queryDiscusslist(Page page);

	void deletediscuss(Discuss discuss);

}
