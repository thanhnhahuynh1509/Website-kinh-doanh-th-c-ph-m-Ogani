package com.ogani.dao;

import com.ogani.helper.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.List;

public class JPADao<T> {
    protected final EntityManagerFactory entityManagerFactory = JPAUtil.getEntityManagerFactory();
    protected EntityManager entityManager;

    public T save(T object) {
        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(object);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return object;
    }

    public T get(Class<T> type, Object id) {
        entityManager = entityManagerFactory.createEntityManager();
        T object = entityManager.find(type, id);
        entityManager.close();
        return object;
    }

    public List<T> list(String nameQuery) {
        entityManager = entityManagerFactory.createEntityManager();
        List<T> list = entityManager.createQuery(nameQuery).getResultList();
        entityManager.close();
        return list;
    }

    public T update(T object) {
        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            object = entityManager.merge(object);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return object;
    }

    public void delete(Class<T> type, int id) {
        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            T obj = entityManager.find(type, id);
            entityManager.remove(obj);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }
}
