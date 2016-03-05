package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.json.JSONObject;

import com.util.Results;
import com.model.Photo;
import com.model.Photos;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.PhotoService;
import com.service.PhotosService;
import com.service.UserService;
import com.util.Page;

public class PhotoAction extends ActionSupport {

	@Resource
	private PhotoService photoService;
	@Resource
	private PhotosService photosService;

	private int currentPage;// page工具类
	private Photo photo;
	private List<File> image; // 上传的文件
	private List<String> imageFileName; // 文件名称
	private List<String> imageContentType; // 文件类型

	public int getCurrentPage() {
		return currentPage;
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

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	// 图片上传
	@SuppressWarnings("deprecation")
	// @Action(value = "photoadd", results = {
	// @Result(name = "success1", type = "redirect", location = "photoslist"),
	//
	// @Result(name = "error", location = "/page/error.jsp") })
	public String add() throws FileNotFoundException, IOException,
			ParseException {
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
				photo.setName(imageFileName.get(i));
				photo.setPhotosId(photo.getPhotosId());
				photo.setPath(dateString + imageFileName.get(i));
				photo.setTime(dateString);
				lastimage = "upload/" + dateString + imageFileName.get(i);
				FileOutputStream fos = new FileOutputStream(
						ServletActionContext.getRequest().getRealPath(
								"/upload/" + photo.getPath()));
				FileInputStream fis = new FileInputStream(files.get(i));
				byte[] buffer = new byte[1024 * 1024];
				int len = 0;
				while ((len = fis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
				fis.close();
				fos.close();
				photoService.save(photo);
			}
			Photos photos1 = photosService.queryby(photo.getPhotosId());
			photos1.setLastimage(lastimage);
			photosService.update(photos1);
		}

		return "success1";
	}

	// 图片上传
	@SuppressWarnings("deprecation")
	public String madd() throws FileNotFoundException, IOException,
			ParseException {
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
				photo.setName(imageFileName.get(i));
				photo.setPhotosId(photo.getPhotosId());
				photo.setPath(dateString + imageFileName.get(i));
				photo.setTime(dateString);
				lastimage = "upload/" + dateString + imageFileName.get(i);
				FileOutputStream fos = new FileOutputStream(
						ServletActionContext.getRequest().getRealPath(
								"/upload/" + photo.getPath()));
				FileInputStream fis = new FileInputStream(files.get(i));
				byte[] buffer = new byte[1024 * 1024];
				int len = 0;
				while ((len = fis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
				fis.close();
				fos.close();
				photoService.save(photo);
			}
			Photos photos1 = photosService.queryby(photo.getPhotosId());
			photos1.setLastimage(lastimage);
			photosService.update(photos1);
		}

		return "success1";
	}

	// 相册的图片列表
	@Action(value = "photobylist", results = {
			@Result(name = "success1", location = "/photo.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String list() {

		Photos photos1 = photosService.queryby(photo.getPhotosId());
		List<Photo> photoList = photoService.Listby(photo);// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("photoList", photoList);
		request.put("photos1", photos1);
		return "success1";
	}

	// ajax图片列表
	@Action(value = "photolist23")
	public void list2() throws IOException, JSONException {
		List<Photo> photoList = photoService.ListbyPId(photo.getPhotosId());// 获得列表对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONArray jsons = new JSONArray();
		for (int i = 0; i < photoList.size(); i++) {
			JSONObject json1 = new JSONObject();
			json1.put("picPos", i + 1);
			json1.put("pid", photoList.get(i).getId());
			json1.put("bigPic", "upload/" + photoList.get(i).getPath());
			json1.put("thumbPic", "upload/" + photoList.get(i).getPath());
			jsons.put(json1);
		}
		System.out.println(jsons.toString());
		out.println(jsons.toString());
		out.flush();
		out.close();
	}

	// 修改图片列表
	@Action(value = "photobylist3", results = {
			@Result(name = "success1", location = "/photolist.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String list3() {
		Photos photos1 = photosService.queryby(photo.getPhotosId());
		List<Photo> photoList = photoService.Listby(photo);// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("photoList", photoList);
		request.put("photos1", photos1);
		return "success1";
	}

	// 修改图片列表
	@Action(value = "mphotobylist3", results = {
			@Result(name = "success1", location = "/mphotolist.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mlist3() {
		Photos photos1 = photosService.queryby(photo.getPhotosId());
		List<Photo> photoList = photoService.Listby(photo);// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("photoList", photoList);
		request.put("photos1", photos1);
		return "success1";
	}

	// 删除照片
	@Action(value = "photodelete", results = {
			@Result(name = "success1", type = "redirect", location = "photoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String delete() {
		photoService.delete(photo);
		return "success1";
	}

	// 删除照片
	@Action(value = "mphotodelete", results = {
			@Result(name = "success1", type = "redirect", location = "mphotoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mdelete() {
		photoService.delete(photo);
		return "success1";
	}

	// 照片名修改
	@Action(value = "photoupdate", results = {
			@Result(name = "success1", type = "redirect", location = "photoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String update() {
		photoService.update(photo);
		return "success1";
	}
	// 照片名修改
	@Action(value = "mphotoupdate", results = {
			@Result(name = "success1", type = "redirect", location = "mphotoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mupdate() {
		photoService.update(photo);
		return "success1";
	}

	// 照片查询
	@Action(value = "photoToupdate", results = {
			@Result(name = "success1", location = "/photoupdate.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String query() {
		Photo photo1 = photoService.query(photo);
		Map request = (Map) ActionContext.getContext().get("request");

		request.put("photo", photo1);
		return "success1";
	}
	// 照片查询
	@Action(value = "mphotoToupdate", results = {
			@Result(name = "success1", location = "/mphotoupdate.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mquery() {
		Photo photo1 = photoService.query(photo);
		Map request = (Map) ActionContext.getContext().get("request");

		request.put("photo", photo1);
		return "success1";
	}

}
