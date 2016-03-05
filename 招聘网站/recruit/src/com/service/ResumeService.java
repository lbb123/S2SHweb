package com.service;

import java.util.List;

import com.model.Resume;
import com.util.Page;
import com.util.Results;

public interface ResumeService {

	void save(Resume resume);

	Results resumelist(Page page);

	void delete(Resume resume);

	Resume queryby(int id);

	void update(Resume resume);

	List<Resume> queryall();

	Results resumelistby(Page page, int id);

	List<Resume> querybyuid(int id);

}
