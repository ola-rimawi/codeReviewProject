package com.exam.belt.repositories;

import com.exam.belt.models.Rate;
import com.exam.belt.models.Show;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RateRepository extends CrudRepository<Rate, Long> {
    List<Rate> findByShowOrderByUserRateAsc(Show show);
}
