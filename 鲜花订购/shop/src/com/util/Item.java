package com.util;

import com.model.Goods;
import com.model.Orderitem;

//购物车里物品
public class Item {
	
	
	private int toprice; 
	private Orderitem orderitem; 
	private Goods goods;
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
	public int getToprice() {
		return toprice;
	}
	public void setToprice(int toprice) {
		this.toprice = toprice;
	}
	

}
