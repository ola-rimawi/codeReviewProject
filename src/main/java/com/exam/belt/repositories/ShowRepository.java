package com.exam.belt.repositories;

import com.exam.belt.models.Show;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShowRepository extends CrudRepository<Show, Long> {
    List<Show> findAll();
}
