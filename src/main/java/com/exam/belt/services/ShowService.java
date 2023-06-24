package com.exam.belt.services;

import com.exam.belt.models.Rate;
import com.exam.belt.models.Show;
import com.exam.belt.models.User;
import com.exam.belt.repositories.RateRepository;
import com.exam.belt.repositories.ShowRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShowService {
    private final ShowRepository showRepository;
    private final RateRepository rateRepository;

    public ShowService(ShowRepository showRepository, RateRepository rateRepository) {
        this.showRepository = showRepository;
        this.rateRepository = rateRepository;
    }

    public List<Show> getAllShows() {
        return showRepository.findAll();
    }

    public Show getShowById(Long id) {
        return showRepository.findById(id).orElse(null);
    }

    public Show createUpdateShow(Show show) {
        return showRepository.save(show);
    }

    public void deleteShowById(Long id) {
        showRepository.deleteById(id);
    }

    public List<Rate> getAllRatesByShow(Show show) {
        return rateRepository.findByShowOrderByUserRateAsc(show);
    }

    public void addRate(Rate rate) {
        rateRepository.save(rate);
    }
}
