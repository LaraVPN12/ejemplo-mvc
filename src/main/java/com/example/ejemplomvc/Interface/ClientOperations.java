package com.example.ejemplomvc.Interface;

import java.util.List;

public interface ClientOperations <T> {
    List<T> findAll();
    T findById(Long id);

    void save(T t);
    void update(T t);
    void delete(Long id);
}
