package web.controller;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.CargoDAO;
import web.modelo.Cargo;
@Transactional
@Controller
@RequestMapping("/cargo")
public class CargoController {
	
	private List<Cargo> lista_cargos;
	
	@Autowired
	CargoDAO dao;
	
	@RequestMapping("/novo")
	public String novo() {
		return "cargo/novo";
	}
	
	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Cargo cargo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "redirect:novo";
		}else if(dao.buscaPorNome(cargo.getNome()).size()>0) { 
            model.addAttribute("mensagem", "Nome já cadastrado. Escolha outro nome.");

			return "cargo/novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(cargo);
		return "redirect:lista";
	}
	
	@RequestMapping("/remove")
	public String remove(Cargo cargo) {
		dao.remove(cargo.getId());
		return "redirect:lista";
	}
	
	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_cargos = dao.lista();
		model.addAttribute("cargos", this.lista_cargos);
		return "cargo/lista";
	}
	
	@RequestMapping("/edita")
	public String edita(int id, Model model) {
		model.addAttribute("cargo", dao.buscaPorId(id));
		return "cargo/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Cargo cargo, BindingResult result) {
	    if (result.hasErrors()) {
	        return "redirect:edita?id=" + cargo.getId();
	    }

	    Cargo existingCargo = dao.buscaPorId(cargo.getId());

	    existingCargo.setNome(cargo.getNome());
	    existingCargo.setSalario(cargo.getSalario());

	    dao.altera(existingCargo);

	    return "redirect:lista";
	}


}
