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

import web.dao.ContratosDAO;
import web.dao.FuncionariosDAO;
import web.dao.CargoDAO;
import web.dao.EmpresaDAO;

import web.modelo.Contratos;
import web.modelo.Funcionarios;
import web.modelo.Cargo;
import web.modelo.Empresa;

@Transactional
@Controller
@RequestMapping("/contratos")
public class ContratosController {

	private List<Contratos> lista_contratos;
	private List<Funcionarios> lista_funcionarios;
	private List<Cargo> lista_cargo;
	private List<Empresa> lista_empresa;

	@Autowired
	ContratosDAO dao;

	@Autowired
	FuncionariosDAO dao_funcionarios;

	@Autowired
	CargoDAO dao_cargo;

	@Autowired
	EmpresaDAO dao_empresa;

	@RequestMapping("/novo")
	public String novo(Model model) {
		this.lista_funcionarios = dao_funcionarios.lista();
		this.lista_cargo = dao_cargo.lista();
		this.lista_empresa = dao_empresa.lista();

		if (this.lista_funcionarios.size() > 0) {
			model.addAttribute("contratos", this.lista_contratos);
			model.addAttribute("funcionarios", this.lista_funcionarios);
			model.addAttribute("cargo", this.lista_cargo);
			model.addAttribute("empresa", this.lista_empresa);
		}

		return "contratos/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Contratos contratos, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "redirect:novo";
		} else if (dao.buscaPorMatricula(contratos.getMatricula()).size() > 0) {
			model.addAttribute("mensagem", "Matrícula já cadastrada. Escolha outro matrícula.");

			return "contratos/novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(contratos);
		return "redirect:lista";
	}

	@RequestMapping("/remove")
	public String remove(Contratos contratos) {
		dao.remove(contratos.getId());
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
	    this.lista_contratos = dao.lista();
	    model.addAttribute("contratos", this.lista_contratos);
	    return "contratos/lista";
	}

	@RequestMapping("/edita")
	public String edita(int id, Model model) {
		model.addAttribute("contratos", dao.buscaPorId(id));
		return "contratos/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Contratos contratos, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:edita?id=" + contratos.getId();
		}

		Contratos existingContratos = dao.buscaPorId(contratos.getId());

		existingContratos.setStatus(contratos.getStatus());
		existingContratos.setMatricula(contratos.getMatricula());
		existingContratos.setDataInicio(contratos.getDataInicio());
		existingContratos.setDataEncerramento(contratos.getDataEncerramento());

		dao.altera(existingContratos);

		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(int id, Model model) {
		model.addAttribute("contratos", dao.buscaPorId(id));
		return "contratos/exibe";
	}

}