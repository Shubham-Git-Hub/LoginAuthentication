package com.hibernate.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.hibernate.model.Logintest;
import com.hibernate.util.HibernateUtil;

public class UserDao {

	public void saveUser(Logintest user) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public boolean validate(String userName, String password) {

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
			String pass = m[0].getPassword();

			if (pass != null && pass.equals(password)) {
				return true;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {

				transaction.rollback();
			}
			e.printStackTrace();
		}
		return false;
	}

}
