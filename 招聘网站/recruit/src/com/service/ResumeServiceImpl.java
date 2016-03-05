package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ResumeDao;
import com.dao.UserDao;
import com.model.Resume;
import com.util.Page;
import com.util.Results;

@Service 
public class ResumeServiceImpl implements ResumeService{
	
	@Resource  
    private ResumeDao ResumeDao;

	//创建简历
	public void save(Resume resume) {
		ResumeDao.save(resume);
		
	}

	//简历列表
	public Results resumelist(Page page) {
		return ResumeDao.Listpages(page);
	}

	//简历删除
	public void delete(Resume resume) {
		ResumeDao.delete(resume);
		
	}

	//简历查询
	public Resume queryby(int id) {
		return ResumeDao.queryby(id);
	}

	//简历修改
	public void update(Resume resume) {
		 ResumeDao.update(resume);
		
	}
	//简历不分页列表
	public List<Resume> queryall() {
		return ResumeDao.queryall();
	}

	//简历列表
	public Results resumelistby(Page page, int id) {
		return ResumeDao.Listpageby(page,id);
	}

	//用户简历列表
	public List<Resume> querybyuid(int id) {
		return ResumeDao.querybyuid(id);
	}

}