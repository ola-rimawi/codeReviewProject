package com.exam.belt.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.exam.belt.models.User;
import com.exam.belt.services.UserService;
import com.exam.belt.validators.UserValidator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
    private final UserService userService;
    private final UserValidator userValidator;

    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }

    @GetMapping("/")
    public String index(@ModelAttribute("registration") User user, Model model, HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/shows";
        }
        return "/users/index.jsp";
    }

    @PostMapping("/")
    public String register(@Valid @ModelAttribute("registration") User user, BindingResult result, HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/shows";
        }
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "/users/index.jsp";
        }
        User newUser = userService.registerUser(user);
        session.setAttribute("userId", newUser.getId());
        return "redirect:/shows";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, RedirectAttributes reAttr) {
        if (userService.isAuthenticated(email, password)) {
            User user = userService.getUserByEmail(email);
            session.setAttribute("userId", user.getId());
            return "redirect:/shows";
        }
        reAttr.addFlashAttribute("error", "INVALID EMAIL OR PASSWORD!");
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        if (session.getAttribute("userId") != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}
