package com.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.model.Goods;
import com.model.Orderitem;

//购物车
public class Cart
{

	protected Map<Integer, Item> items;

	public Cart()
	{

		if (items == null)
		{
			items = new HashMap<Integer, Item>();
		}
	}

	//购物车添加物品
	public void addGoods(Integer goodsId, Item item)
	{
		//判断是否有该物品
		if (items.containsKey(goodsId))
		{

			Item _item = items.get(goodsId);
			_item.getOrderitem().setGnum(_item.getOrderitem().getGnum()+ item.getOrderitem().getGnum());
			_item.setToprice(_item.getOrderitem().getGnum()*Integer.valueOf(item.getGoods().getGprice()));
			items.put(goodsId, _item);
		} else
		{
			item.setToprice(item.getOrderitem().getGnum()*Integer.valueOf(item.getGoods().getGprice()));
			items.put(goodsId, item);
		}
	}
	
	//删除购物车物品
	public void delGoods(Integer goodsId)
	{
		items.remove(goodsId);
	}
	

	//更新购物车物品数量
	public void updateCart(Integer goodsId, int quantity)
	{

		Item orderItem = items.get(goodsId);
		orderItem.getOrderitem().setGnum(quantity);
		items.put(goodsId, orderItem);
	}

	public int getTotalPrice()
	{

		int totalPrice = 199;
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{

//			Goods goods =null; //orderItem.getGoods();
//			int quantity = orderItem.getGnum();
//			totalPrice += Integer.valueOf(goods.getGprice()) * quantity;
		}
		return totalPrice;
	}

	public Map<Integer, Item> getItems()
	{
		return items;
	}



}
