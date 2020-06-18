package com.hibernate.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.hibernate.model.logintest;
import com.hibernate.util.HibernateUtil;

public class UserDao {

    public void saveUser(logintest user) {
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
        logintest user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (logintest) session.createQuery("FROM logintest U WHERE U.USERNAME = :userName").setParameter("userName", userName);

            if (user != null && user.getPassword().equals(password)) {
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
