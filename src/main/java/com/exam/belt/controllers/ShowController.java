package com.exam.belt.controllers;

import com.exam.belt.models.Rate;
import com.exam.belt.models.Show;
import com.exam.belt.services.ShowService;
import com.exam.belt.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/shows")
public class ShowController {
    private final UserService userService;
    private final ShowService showService;

    public ShowController(UserService userService, ShowService showService) {
        this.userService = userService;
        this.showService = showService;
    }

    public Long getUserIdSession(HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return null;
        }
        return (Long) session.getAttribute("userId");
    }

    @GetMapping("")
    public String index(Model model, HttpSession session) {
        Long userId = getUserIdSession(session);
        if (userId == null) {
            return "redirect:/";
        }
        model.addAttribute("user", userService.getUserById(userId));
        model.addAttribute("shows", showService.getAllShows());
        return "/shows/index.jsp";
    }

    @GetMapping("/{id}")
    public String displayShow(@PathVariable("id") Long id, @ModelAttribute("rate") Rate rate, Model model, HttpSession session) {
        Long userId = getUserIdSession(session);
        if (userId == null) {
            return "redirect:/";
        }
        Show show = showService.getShowById(id);
        List<Rate> showRates = showService.getAllRatesByShow(show);
        model.addAttribute("show", show);
        model.addAttribute("showRates", showRates);
        model.addAttribute("userId", userId);
        return "/shows/showPage.jsp";
    }

    @PostMapping("/{id}/rate")
    public String addRate(@PathVariable("id") Long id, @Valid @ModelAttribute("rate") Rate rate, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            Long userId = getUserIdSession(session);
            Show show = showService.getShowById(id);
            List<Rate> showRates = showService.getAllRatesByShow(show);
            model.addAttribute("show", show);
            model.addAttribute("showRates", showRates);
            model.addAttribute("userId", userId);
            return "/shows/showPage.jsp";
        }
        showService.addRate(rate);
        return "redirect:/shows";
    }

    @GetMapping("/{id}/edit")
    public String displayEdit(@PathVariable("id") Long id, HttpSession session, Model model) {
        Long userId = getUserIdSession(session);
        if (userId == null) {
            return "redirect:/";
        }
        Show show = showService.getShowById(id);
        model.addAttribute("show", show);
        model.addAttribute("userId", userId);
        return "/shows/editPage.jsp";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public String updateShow(@PathVariable("id") Long id, @Valid @ModelAttribute("show") Show show, BindingResult result, HttpSession session, Model model) {
        if (result.hasErrors()) {
            Long userId = getUserIdSession(session);
            Show currentShow = showService.getShowById(id);
            model.addAttribute("currentShow", currentShow);
            model.addAttribute("userId", userId);
            return "/shows/editPage.jsp";
        }
        showService.createUpdateShow(show);
        return "redirect:/shows";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String deleteShow(@PathVariable("id") Long id) {
        showService.deleteShowById(id);
        return "redirect:/shows";
    }

    @GetMapping("/new")
    public String displayAddNew(@ModelAttribute("show") Show show, HttpSession session, Model model) {
        Long userId = getUserIdSession(session);
        if (userId == null) {
            return "redirect:/";
        }
        model.addAttribute("userId", userId);
        return "/shows/newPage.jsp";
    }

    @PostMapping("")
    public String addShow(@Valid @ModelAttribute("show") Show show, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            Long userId = getUserIdSession(session);
            model.addAttribute("userId", userId);
            return "/shows/newPage.jsp";
        }
        showService.createUpdateShow(show);
        return "redirect:/shows";
    }
}
