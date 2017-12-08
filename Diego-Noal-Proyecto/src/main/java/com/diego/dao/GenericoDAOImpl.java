package com.diego.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class GenericoDAOImpl {

	@Autowired
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() { return sessionFactory; }
	public void setSessionFactory(SessionFactory sF) { this.sessionFactory = sF; }
	
}
