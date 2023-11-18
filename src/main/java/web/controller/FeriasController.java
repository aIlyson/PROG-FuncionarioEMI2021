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

import web.dao.FeriasDAO;
import web.dao.ContratosDAO;
import web.modelo.Ferias;
import web.modelo.Contratos;

@Transactional
@Controller
@RequestMapping("/ferias")
public class FeriasController {

	private List<Ferias> lista_ferias;
	private List<Contratos> lista_contratos;

	@Autowired
	FeriasDAO dao;

	@Autowired
	ContratosDAO dao_contratos;

	@RequestMapping("/novo")
	public String novo(Model model) {
		this.lista_contratos = dao_contratos.lista();
		if (this.lista_contratos.size() > 0) {
			model.addAttribute("contratos", this.lista_contratos);
		}
		return "ferias/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Ferias ferias, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "redirect:novo";

		}

		// Adiciona no banco de dados
		dao.adiciona(ferias);
		return "redirect:lista";
	}

	@RequestMapping("/remove")
	public String remove(Ferias ferias) {
		dao.remove(ferias.getId());
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_ferias = dao.lista();
		model.addAttribute("ferias", this.lista_ferias);
		return "ferias/lista";
	}

	@RequestMapping("/edita")
	public String edita(int id, Model model) {
		model.addAttribute("ferias", dao.buscaPorId(id));
		return "ferias/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Ferias ferias, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:edita?id=" + ferias.getId();
		}

		Ferias existingFerias = dao.buscaPorId(ferias.getId());

		existingFerias.setDataInicio(ferias.getDataInicio());
		existingFerias.setDataEncerramento(ferias.getDataEncerramento());

		dao.altera(existingFerias);

		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(int id, Model model) {
		model.addAttribute("ferias", dao.buscaPorId(id));
		return "ferias/exibe";
	}

}