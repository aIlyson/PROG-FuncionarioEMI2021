package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OlaMundoController {

	@RequestMapping("/olamundo")
	public String execute() {
		System.out.println("Executando a lógica com Spring MVC");
		return "olamundo";
	}
}
