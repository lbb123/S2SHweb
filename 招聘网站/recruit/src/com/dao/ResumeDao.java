package com.dao;

import java.util.List;

import com.model.Resume;
import com.util.Page;
import com.util.Results;

public interface ResumeDao {

	void save(Resume resume);

	Results Listpages(Page page);

	void delete(Resume resume);

	Resume queryby(int id);

	void update(Resume resume);

	List<Resume> queryall();

	Results Listpageby(Page page, int id);

	List<Resume> querybyuid(int id);

}
