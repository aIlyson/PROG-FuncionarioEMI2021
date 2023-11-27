package web.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.UserDAO;
import web.modelo.User;

@Controller
@Transactional
@RequestMapping("/usuario")
public class UserController {

    @Autowired
    private UserDAO userDAO;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String showLoginPage() {
        return "index";
    }

   
    @PostMapping("register")
    public String registerUser(@RequestParam String email, @RequestParam String senha, Model model) {
      
    	if (userDAO.buscaPorEmail(email).isEmpty()) {
        
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setSenha(passwordEncoder.encode(senha));

            userDAO.adiciona(newUser);

            return "login/novo";
        } else {
            model.addAttribute("error", "E-mail já em uso. Tente outro e-mail.");
            return "login/novo";
        }
        
        
    }

   
}
