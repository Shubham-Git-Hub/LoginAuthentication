package com.hibernate.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.model.Logintest;
import com.hibernate.util.HibernateUtil;

public class NewOrOldUser {

	public boolean Checker(String userName) {

		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			Query q = session.createQuery("FROM Logintest  WHERE Username = :userName");
			q.setParameter("userName", userName);
			List<Logintest> l = q.getResultList();
			Logintest[] m = new Logintest[l.size()];
			m = (Logintest[]) l.toArray(m);
			String user = m[0].getUsername();

			if (user != null) {
				return true;
			}
		} catch (Exception e) {
			if (transaction != null) {
				return false;

			}
			e.printStackTrace();

		}
		return false;
	}

}
