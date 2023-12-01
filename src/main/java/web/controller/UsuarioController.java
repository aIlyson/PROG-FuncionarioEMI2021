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

import web.dao.UsuarioDao;
import web.modelo.Usuario;

@Controller
@Transactional
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	private UsuarioDao userDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/login")
	public String showLoginPage() {
		return "index";
	}

	@PostMapping("register")
	public String registerUsuario(@RequestParam String email, @RequestParam String senha, Model model) {
		Usuario newUsuario = new Usuario();
		newUsuario.setEmail(email);
		newUsuario.setSenha(passwordEncoder.encode(senha));
		userDAO.adiciona(newUsuario);
		
		return "login/novo";
	}

}