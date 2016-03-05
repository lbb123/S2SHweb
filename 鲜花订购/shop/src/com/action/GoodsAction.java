package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Admin;
import com.model.Catelog;
import com.model.Goods;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.service.CatelogService;
import com.service.GoodsService;
import com.util.Page;
import com.util.Results;

//物品
public class GoodsAction extends ActionSupport {
	@Resource
	private GoodsService goodsService;
	private Goods goods;
	private int currentPage;// page工具类
	private List<File> image; // 上传的文件
	private List<String> imageFileName; // 文件名称
	private List<String> imageContentType; // 文件类型

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public List<File> getImage() {
		return image;
	}

	public void setImage(List<File> image) {
		this.image = image;
	}

	public List<String> getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(List<String> imageFileName) {
		this.imageFileName = imageFileName;
	}

	public List<String> getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(List<String> imageContentType) {
		this.imageContentType = imageContentType;
	}

	//添加
	@SuppressWarnings("deprecation")
	@Action(value = "goodsadd", results = {
			@Result(name = "success",type="redirect", location = "/goodslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() throws Exception {
		ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
		// 取得需 要上传的文件数组
		List<File> files = getImage();
		String lastimage = null;
		if (files != null && files.size() > 0) {
			for (int i = 0; i < files.size(); i++) {
				SimpleDateFormat formatter = new SimpleDateFormat(
						"yyyyMMddHHmmss");
				String dateString = formatter.format(new Date());
				Date date = formatter.parse(dateString);
				long currentTime = date.getTime();
				goods.setGpic(dateString + imageFileName.get(i));
				FileOutputStream fos = new FileOutputStream(
						ServletActionContext.getRequest().getRealPath(
								"/upload/" + goods.getGpic()));
				FileInputStream fis = new FileInputStream(files.get(i));
				byte[] buffer = new byte[1024 * 1024];
				int len = 0;
				while ((len = fis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
				fis.close();
				fos.close();
			}
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		goods.setGdate(dateString);
		goodsService.save(goods);
		return "success";
	}

	//查询
	@Action(value = "goodsToUpdate", results = {
			@Result(name = "success", location = "/admin/goodsupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Goods query= goodsService.querybyid(goods.getGid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goods", query);
		return "success";
	}
	//查询
	@Action(value = "goodsTodetail", results = {
			@Result(name = "success", location = "/admin/goodsdetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String query() {
		Goods query= goodsService.querybyid(goods.getGid());
		String catelogname= goodsService.querycid(query.getCid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goods", query);
		request.put("catelogname", catelogname);
		return "success";
	}

	//修改
	@Action(value = "goodsupdate", results = {
			@Result(name = "success", type="redirect", location = "/goodslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		goods.setGdate(dateString);
		goodsService.update(goods);
		return "success";
	}
	
	// ajax列表
	@Action(value = "goodsajaxlist")
	public void goodsajaxlist() throws IOException {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = goodsService.list(page);
		page = result.getPage();// 获得页数对象
		List<Goods> goodsList = result.getList();// 获得列表对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(goodsList);
		System.out.println(json.toString());
		out.println(json.toString());
		out.flush();
		out.close();
	}

	//管理员列表
	@Action(value = "goodslist", results = {
			@Result(name = "success", location = "/admin/goodslist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String list() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = goodsService.list(page);
		page = result.getPage();// 获得页数对象
		List<Goods> goodsList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		request.put("page", page);
		return "success";
	}
	//浏览商品列表
	@Action(value = "allgoodslist", results = {
			@Result(name = "success", location = "/goodslist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String alllist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = goodsService.list(page);
		page = result.getPage();// 获得页数对象
		List<Goods> goodsList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		request.put("page", page);
		return "success";
	}
	//查询商品列表
	@Action(value = "querygoodslist", results = {
			@Result(name = "success", location = "/querygoodslist.jsp"),
			@Result(name = "error", location = "/querygoodslist.jsp") })
	public String querygoodslist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(10);// 设置每页页数
		Results result = goodsService.querygoodslist(page,goods);
		page = result.getPage();// 获得页数对象
		List<Goods> goodsList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		request.put("page", page);
		if (goodsList != null && goodsList.size() > 0) {
			request.put("mes", "查找成功");
			return "success";
		} else {
			request.put("mes", "无查询结果");
			return "error";
		}
	}

	//删除
	@Action(value = "goodsdelete", results = {
			@Result(name = "success", type = "redirect", location = "/goodslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String delete() {
		goodsService.delete(goods);
		return "success";
	}
}
