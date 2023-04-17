package com.example.ejemplomvc.Service;

import com.example.ejemplomvc.Interface.ClientOperations;
import com.example.ejemplomvc.Modelo.Cliente;
import com.example.ejemplomvc.Utilities.AdapterJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ClientService implements ClientOperations<Cliente> {

    private final EntityManager em = AdapterJPA.getEntityManagerFactory();

    @Override
    public List<Cliente> findAll() {
        TypedQuery<Cliente> query = em.createQuery("SELECT c FROM Cliente c", Cliente.class);
        return query.getResultList();
    }

    @Override
    public Cliente findById(Long id) {
        return em.find(Cliente.class, id);
    }

    @Override
    public void save(Cliente cliente) {
        em.getTransaction().begin();
        em.persist(cliente);
        em.getTransaction().commit();
    }

    @Override
    public void update(Cliente cliente) {
        em.getTransaction().begin();
        em.merge(cliente);
        em.getTransaction().commit();
    }

    @Override
    public void delete(Long id) {
        em.getTransaction().begin();
        Cliente cliente = em.find(Cliente.class, id);
        em.remove(cliente);
        em.getTransaction().commit();
    }
}
