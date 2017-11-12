package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.*;
import dbutil.*;

public class Orderdao {
	
	public int insertOrder(String username, String id[], int amount[] ){
		int ordernumber = 0;
		try
		{
			DatabaseLink db = new DatabaseLink();
			Connection conn=db.getConn();		
			Statement state =conn.createStatement();
			ResultSet rs1 = state.executeQuery("select ordernumber from order order by ordernumber desc");
			if(rs1.next())
			{
				ordernumber = rs1.getInt("ordernumber")+1;
			}
			else
			{
				ordernumber = 1;
			}
			PreparedStatement pstate = conn.prepareStatement("insert into order(ordernumber,username,id,amount) values (?,?,?,?)");
			pstate.setInt(1, ordernumber);
			pstate.setNString(2, username);
			for(int i = 0; i<id.length; i++)
			{
				pstate.setNString(3, id[i]);
				pstate.setInt(4, amount[i]);
				pstate.executeUpdate();
			}
		    conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return ordernumber;//返回0说明连接数据库失败
	}
	
	
	public  List<Order> showOrder(int ordernumber) throws Exception{
		List<Order> orderList=new ArrayList<Order>();
		try {
			DatabaseLink db = new DatabaseLink();
		    Connection conn = db.getConn();
			PreparedStatement pstate1 =conn.prepareStatement("select * from order where ordernumber=? order by id");
			PreparedStatement pstate2 =conn.prepareStatement("select * from goods where id=?");
			pstate1.setInt(1, ordernumber);
			ResultSet rs1 = pstate1.executeQuery();
			while(rs1.next()){
				Order goods = new Order(null, null, ordernumber, null, null, 0, 0, 0);
				goods.setUsername(rs1.getString("username"));	
				goods.setId(rs1.getString("id"));
				goods.setAmount(rs1.getInt("amount"));
				pstate2.setNString(1, rs1.getString("id"));
				ResultSet rs2 = pstate2.executeQuery();
				goods.setName(rs2.getString("name"));
				goods.setPicture(rs2.getString("picture"));
				goods.setPrice(rs2.getFloat("price"));
				goods.setTotal(rs1.getInt("amount")*rs2.getFloat("price"));
				orderList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
	public  float getOrderTotal(int ordernumber) throws Exception{
		float ordertotal = 0;
		try {
			DatabaseLink db = new DatabaseLink();
		    Connection conn = db.getConn();
			PreparedStatement pstate1 =conn.prepareStatement("select * from order where ordernumber=? order by id");
			PreparedStatement pstate2 =conn.prepareStatement("select * from goods where id=?");
			pstate1.setInt(1, ordernumber);
			ResultSet rs1 = pstate1.executeQuery();
			while(rs1.next()){
				pstate2.setNString(1, rs1.getString("id"));
				ResultSet rs2 = pstate2.executeQuery();
				ordertotal = ordertotal + rs1.getInt("amount")*rs2.getFloat("price");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ordertotal;
	}

}