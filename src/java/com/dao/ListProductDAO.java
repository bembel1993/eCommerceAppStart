package com.dao;

import com.connection.DBContext;
import com.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ListProductDAO {
	public List<Product> search(String characters) throws Exception {
		String sql = "select * from tblproduct where name like '%"+characters+"%'";
		DBContext d = new DBContext();
		Connection conn = d.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		List<Product> l = new ArrayList<Product>();
		while (rs.next()) {
			Product p = new Product();
			p.setId(rs.getInt("id"));
			p.setActive(rs.getString("active"));
			p.setCode(rs.getString("code"));
			p.setDescription(rs.getString("description"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getString("price"));
			p.setProduct_category(rs.getString("product_category"));
			p.setSrc(rs.getString("product_img_source"));
			l.add(p);
		}

		rs.close();
		conn.close();
		return l;
	}

	public List<Product> getAllProduct() throws Exception {
		String sql = "select * from tblproduct";
		DBContext d = new DBContext();
		Connection conn = d.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		List<Product> l = new ArrayList<Product>();
		while (rs.next()) {
			Product p = new Product();
			p.setId(rs.getInt("id"));
			p.setActive(rs.getString("active"));
			p.setCode(rs.getString("code"));
			p.setDescription(rs.getString("description"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getString("price"));
			p.setProduct_category(rs.getString("product_category"));
			p.setSrc(rs.getString("product_img_source"));
			l.add(p);
		}

		rs.close();
		conn.close();
		return l;
	}

	/*	public Product getProduct(String characters) throws Exception {
		String sql = "select * from tblproduct where id = "+characters;
		DBContext d = new DBContext();
		Connection conn = d.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		List<Product> l = new ArrayList<Product>();
		while (rs.next()) {
			Product p = new Product();
			p.setId(rs.getInt("id"));
			p.setActive(rs.getString("active"));
			p.setCode(rs.getString("code"));
			p.setDescription(rs.getString("description"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getString("price"));
			p.setProduct_category(rs.getString("product_category"));
			l.add(p);
			return p;
		}
		return null;

	}*/
}
