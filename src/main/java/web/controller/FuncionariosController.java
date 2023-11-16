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

import web.dao.EnderecoDAO;
import web.dao.FuncionariosDAO;
import web.modelo.Endereco;
import web.modelo.Funcionarios;
@Transactional
@Controller
@RequestMapping("/funcionarios")
public class FuncionariosController {
	
	private List<Funcionarios> lista_funcionarios;
	private List<Endereco> lista_enderecos;
	
	@Autowired
	FuncionariosDAO dao;
	
	@Autowired
	EnderecoDAO dao_endereco;
	
	@RequestMapping("/novo")
	public String novo(Model model) {
		this.lista_enderecos = dao_endereco.listar();
		if(this.lista_enderecos.size()>0) {
			model.addAttribute("enderecos",this.lista_enderecos);
			return "funcionarios/novo";
		}
			return "funcionarios/novo";
		
	}
	
	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Funcionarios funcionarios, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "redirect:novo";
		}else if(dao.buscaPorEmail(funcionarios.getEmail()).size()>0) { 
            model.addAttribute("mensagem", "Email já cadastrado. Escolha outro email.");

			return "funcionarios/novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(funcionarios);
		return "redirect:lista";
	}
	
	@RequestMapping("/remove")
	public String remove(Funcionarios funcionarios) {
		dao.remove(funcionarios.getId());
		return "redirect:lista";
	}
	
	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_funcionarios = dao.lista();
		model.addAttribute("funcionarios", this.lista_funcionarios);
		return "funcionarios/lista";
	}
	
	@RequestMapping("/edita")
	public String edita(int id, Model model) {
		model.addAttribute("funcionarios", dao.buscaPorId(id));
		return "funcionarios/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Funcionarios funcionarios, BindingResult result) {
	    if (result.hasErrors()) {
	        return "redirect:edita?id=" + funcionarios.getId();
	    }

	    Funcionarios existingFuncionarios = dao.buscaPorId(funcionarios.getId());

	    existingFuncionarios.setNome(funcionarios.getNome());
	    existingFuncionarios.setDataNascimento(funcionarios.getDataNascimento());
	    existingFuncionarios.setStatus(funcionarios.getStatus());
	    existingFuncionarios.setEmail(funcionarios.getEmail());
	    
	    
	    dao.altera(existingFuncionarios);

	    return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(int id, Model model) {
		model.addAttribute("funcionarios", dao.buscaPorId(id));
		return "funcionarios/exibe";
	}

}