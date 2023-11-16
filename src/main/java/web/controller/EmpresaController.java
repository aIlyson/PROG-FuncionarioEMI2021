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

import web.dao.EmpresaDAO;
import web.modelo.Empresa;
@Transactional
@Controller
@RequestMapping("/empresa")
public class EmpresaController {
	
	private List<Empresa> lista_empresa;
	
	@Autowired
	EmpresaDAO dao;
	
	@RequestMapping("/novo")
	public String novo() {
		return "empresa/novo";
	}
	
	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Empresa empresa, BindingResult result, Model model) {
	    if (result.hasErrors()) {
	        return "redirect:novo";
	    } else if (dao.buscaPorCnpj(empresa.getCnpj()).size() > 0) {
	        model.addAttribute("mensagem", "Cnpj já cadastrado. Escolha outro cnpj.");
	        return "empresa/novo";
	    }

	    // Adiciona no banco de dados
	    dao.adiciona(empresa);
	    return "redirect:lista";
	}
	
	@RequestMapping("/remove")
	public String remove(Empresa empresa) {
		dao.remove(empresa.getId());
		return "redirect:lista";
	}
	
	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_empresa = dao.lista();
		model.addAttribute("empresa", this.lista_empresa);
		return "empresa/lista";
	}
	
	@RequestMapping("/edita")
	public String edita(int id, Model model) {
		model.addAttribute("empresa", dao.buscaPorId(id));
		return "empresa/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Empresa empresa, BindingResult result) {
	    if (result.hasErrors()) {
	        return "redirect:edita?id=" + empresa.getId();
	    }

	    Empresa existingEmpresa = dao.buscaPorId(empresa.getId());

	    existingEmpresa.setNome(empresa.getNome());
	    existingEmpresa.setCnpj(empresa.getCnpj());
	    existingEmpresa.setRazao(empresa.getRazao());
	    existingEmpresa.setCep(empresa.getCep());
	    existingEmpresa.setEstado(empresa.getEstado());
	    existingEmpresa.setCidade(empresa.getCidade());
	    existingEmpresa.setEmail(empresa.getEmail());


	    dao.altera(existingEmpresa);

	    return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(int id, Model model) {
		model.addAttribute("empresa", dao.buscaPorId(id));
		return "empresa/exibe";
	}

}
