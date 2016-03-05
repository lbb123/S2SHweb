package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Admin;
import com.model.Catelog;
import com.model.Goods;
import com.model.Message;
import com.model.Order;
import com.model.Orderitem;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.service.CatelogService;
import com.service.GoodsService;
import com.service.OrderService;
import com.util.Cart;
import com.util.Item;
import com.util.Page;
import com.util.Results;

//订单
public class OrderAction extends ActionSupport {
	@Resource
	private OrderService orderService;
	private Order order;
	private Orderitem orderitem;
	private Goods goods;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Orderitem getOrderitem() {
		return orderitem;
	}

	public void setOrderitem(Orderitem orderitem) {
		this.orderitem = orderitem;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	//添加
	@SuppressWarnings("deprecation")
	@Action(value = "orderadd", results = {
			@Result(name = "success",type="redirect", location = "/orderlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(new Date());
		String dateString2 = formatter2.format(new Date());
		order.setOdate(dateString);
		order.setObiaohao(dateString2);
		order.setOtype("已付款未发货");
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		Map<Integer, Item> mapitems=cart.getItems();
		int totalprice=0;
		for (Item value : mapitems.values()) {
			totalprice+=value.getOrderitem().getGnum()*Integer.valueOf(value.getGoods().getGprice());
		}
		order.setOzongjia(String.valueOf(totalprice));
		orderService.save(order);
		Order queryOrder= orderService.querybyobiaohao(order.getObiaohao());
		orderitem.setOid(queryOrder.getOid());
		for (Item value : mapitems.values()) {
			orderitem.setGid(value.getOrderitem().getGid());
			orderitem.setGnum(value.getOrderitem().getGnum());
			orderService.saveitem(orderitem);
		}
		cart.getItems().clear();
		session.put("cart", cart);
		return "success";
	}

	//订单详情查询
	@Action(value = "orderTodetail", results = {
			@Result(name = "success", location = "/orderdetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Order queryOrder= orderService.querybyid(order.getOid());
		List<Orderitem> orderitemList=orderService.orderitemList(order.getOid());
		List<Item> itemList = new ArrayList<Item>();
		
		for (Orderitem queryorderitem : orderitemList) {
			int totalprice=0;
			Goods queryGoods= orderService.queryGoods(queryorderitem.getGid());
			totalprice+=queryorderitem.getGnum()*Integer.valueOf(queryGoods.getGprice());
			Item item=new Item();
			item.setToprice(totalprice);
			item.setGoods(queryGoods);
			item.setOrderitem(queryorderitem);
			itemList.add(item);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("order", queryOrder);
		request.put("itemList", itemList);
		return "success";
	}
	//订单详情查询
	@Action(value = "adminorderTodetail", results = {
			@Result(name = "success", location = "/admin/orderdetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminquerybyid() {
		Order queryOrder= orderService.querybyid(order.getOid());
		List<Orderitem> orderitemList=orderService.orderitemList(order.getOid());
		List<Item> itemList = new ArrayList<Item>();
		for (Orderitem queryorderitem : orderitemList) {
			int totalprice=0;
			Goods queryGoods= orderService.queryGoods(queryorderitem.getGid());
			totalprice+=queryorderitem.getGnum()*Integer.valueOf(queryGoods.getGprice());
			Item item=new Item();
			item.setToprice(totalprice);
			item.setGoods(queryGoods);
			item.setOrderitem(queryorderitem);
			itemList.add(item);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("order", queryOrder);
		request.put("itemList", itemList);
		return "success";
	}
	
	
	//物品详情
	@Action(value = "allgoodsTodetail", results = {
			@Result(name = "success", location = "/goodsdetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String query() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = orderService.messagelistgoods(page,orderitem.getGid());
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Goods query= orderService.queryGoods(orderitem.getGid());
		String catelogname= orderService.querycatelog(query.getCid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goods", query);
		request.put("catelogname", catelogname);
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}

	//修改-订单出货
	@Action(value = "orderupdate", results = {
			@Result(name = "success", type="redirect", location = "/adminorderlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		Order queryOrder= orderService.querybyid(order.getOid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		queryOrder.setOdate(dateString);
		List<Orderitem> orderitemList=orderService.orderitemList(queryOrder.getOid());
		for (Orderitem queryorderitem : orderitemList) {
			Goods queryGoods= orderService.queryGoods(queryorderitem.getGid());
			queryGoods.setGkucun(queryGoods.getGkucun()-queryorderitem.getGnum());
			orderService.updateGoods(queryGoods);
		}
		queryOrder.setOtype("已付款，商品已出库");
		orderService.update(queryOrder);
		return "success";
	}

	//列表
	@Action(value = "orderlist", results = {
			@Result(name = "success", location = "/orderlist.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String list() {
		Map session= ServletActionContext.getContext().getSession();
		User user = (User)session.get("user");
		try {
			if (user.getName()==null||user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = orderService.listuser(page,user.getId());
		page = result.getPage();// 获得页数对象
		List<Order> orderList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("orderList", orderList);
		request.put("page", page);
		return "success";
	}
	//管理员列表
	@Action(value = "adminorderlist", results = {
			@Result(name = "success", location = "/admin/orderlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = orderService.list(page);
		page = result.getPage();// 获得页数对象
		List<Order> orderList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("orderList", orderList);
		request.put("page", page);
		return "success";
	}
	
	
	//管理员列表
	@Action(value = "aorderlist", results = {
			@Result(name = "success", location = "/admin/orderlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String alist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = orderService.list(page);
		page = result.getPage();// 获得页数对象
		List<Order> orderList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("orderList", orderList);
		request.put("page", page);
		return "success";
	}

	//删除
	@Action(value = "orderdelete", results = {
			@Result(name = "success", type = "redirect", location = "/adminorderlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String delete() {
//		List<Orderitem> orderitemList=orderService.orderitemList(order.getOid());
		orderService.delete(order);
		return "success";
	}
	//加入购物车
	@Action(value = "cartadd", results = {
			@Result(name = "success", type = "redirect", location = "/mycart"),
			@Result(name = "error", location = "/404.jsp") })
	public String cartadd() {
		Goods query= orderService.queryGoods(orderitem.getGid());
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		Item item=new Item();
		item.setGoods(query);
		item.setOrderitem(orderitem);
		cart.addGoods(orderitem.getGid(), item);
		session.put("cart",cart);
		return "success";
	}
	//我的购物车
	@Action(value = "mycart", results = {
			@Result(name = "success", location = "/mycart.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String mychart() {
		Map session= ServletActionContext.getContext().getSession();
		User user = (User)session.get("user");
		try {
			if (user.getName()==null||user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Cart cart = (Cart)session.get("cart");
		Map<Integer, Item> mapitems=cart.getItems();
		int totalprice=0;
		for (Item value : mapitems.values()) {
			totalprice+=value.getOrderitem().getGnum()*Integer.valueOf(value.getGoods().getGprice());
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("totalprice", totalprice);
		return "success";
	}
	

	//清空购物车
	@SuppressWarnings("deprecation")
	@Action(value = "cartclear", results = {
			@Result(name = "success",type="redirect", location = "/mycart"),
			@Result(name = "error", location = "/404.jsp") })
	public String cartclear() throws Exception {
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.getItems().clear();
		session.put("cart", cart);
		return "success";
	}
	//修改购物车物品数量
	@SuppressWarnings("deprecation")
	@Action(value = "cartupdate", results = {
			@Result(name = "success",type="redirect", location = "/mycart"),
			@Result(name = "error", location = "/404.jsp") })
	public String cartupdate() throws Exception {
		Goods query= orderService.queryGoods(orderitem.getGid());
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		Item item=new Item();
		item.setGoods(query);
		item.setOrderitem(orderitem);
		cart.updateCart(orderitem.getGid(), orderitem.getGnum());
		Map<Integer, Item> mapitems=cart.getItems();
		session.put("cart", cart);
		return "success";
	}
	//清除购物车物品数量
	@SuppressWarnings("deprecation")
	@Action(value = "cartdelete", results = {
			@Result(name = "success",type="redirect", location = "/mycart"),
			@Result(name = "error", location = "/404.jsp") })
	public String cartdelete() throws Exception {
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.delGoods(orderitem.getGid());
		session.put("cart", cart);
		return "success";
	}
	
}
