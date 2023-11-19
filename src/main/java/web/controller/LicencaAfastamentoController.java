package web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.LicencaAfastamentoDAO;
import web.dao.FuncionariosDAO;
import web.modelo.LicencaAfastamento;
import web.modelo.Funcionarios;

@Controller
@RequestMapping("/licenca")
public class LicencaAfastamentoController {

	private List<LicencaAfastamento> lista_licencaafastamento;
	private List<Funcionarios> lista_funcionarios;

	@Autowired
	private LicencaAfastamentoDAO dao;

	@Autowired
	private FuncionariosDAO dao_funcionarios;

	@RequestMapping("/novo")
	public String novo(Model model) {
		this.lista_licencaafastamento = dao.lista();
		this.lista_funcionarios = dao_funcionarios.lista();

		if (this.lista_funcionarios.size() > 0) {
			model.addAttribute("licencaafastamento", this.lista_licencaafastamento);
			model.addAttribute("funcionarios", this.lista_funcionarios);
		}

		return "licenca/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid LicencaAfastamento licencaafastamento, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "licenca/novo";

		}

		// Adiciona no banco de dados
		dao.adiciona(licencaafastamento);
		return "redirect:lista";
	}

	@RequestMapping("/remove")
	public String remove(@RequestParam("id") int id) {
		dao.remove(id);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
	    List<LicencaAfastamento> licencasFuncionarios = dao.listaFuncionariosComLicencas();
	    model.addAttribute("licencaafastamento", licencasFuncionarios);
	    return "licenca/lista";
	}
	
	 @RequestMapping("/licencasFuncionario")
	    public String licencasFuncionario(@RequestParam("id") int id, Model model) {
	        Funcionarios funcionario = dao_funcionarios.buscaPorId(id);
	        List<LicencaAfastamento> licencasDoFuncionario = dao.listaLicencasPorFuncionario(id);
	        model.addAttribute("funcionario", funcionario);
	        model.addAttribute("licencasDoFuncionario", licencasDoFuncionario);
	        return "licenca/licencasFuncionario";
	    }

	@RequestMapping("/edita")
	public String edita(int id, Model model) {
		model.addAttribute("licencaafastamento", dao.buscaPorId(id));
		return "licenca/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid LicencaAfastamento licencaafastamento, BindingResult result) {
		if (result.hasErrors()) {
			return "licenca/edita";
		}

		LicencaAfastamento existingLicencaAfastamento = dao.buscaPorId(licencaafastamento.getId());

		existingLicencaAfastamento.setDataInicio(licencaafastamento.getDataInicio());
		existingLicencaAfastamento.setDataFim(licencaafastamento.getDataFim());
		
		dao.altera(existingLicencaAfastamento);

		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(@RequestParam("id") int id, Model model) {
		model.addAttribute("licencaafastamento", dao.buscaPorId(id));
		return "licenca/exibe";
	}
}
