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

import web.dao.EnderecoDAO;
import web.modelo.Endereco;

@Controller
@RequestMapping("/endereco")
public class EnderecoController {

    @Autowired
    private EnderecoDAO dao;

    @RequestMapping("/novo")
    public String novo() {
        return "endereco/novo";
    }

    @RequestMapping(value = "/adiciona", method = RequestMethod.POST)
    public String adiciona(@Valid Endereco endereco, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "endereco/novo";

        }

        // Adiciona no banco de dados
        dao.adiciona(endereco);
        return "redirect:lista";
    }

    @RequestMapping("/remove")
    public String remove(@RequestParam("id") int id) {
        dao.remover(id);
        return "redirect:lista";
    }

    @RequestMapping("/lista")
    public String lista(Model model) {
        List<Endereco> listaEndereco = dao.listar();
        model.addAttribute("endereco", listaEndereco);
        return "endereco/lista";
    }

    @RequestMapping("/edita")
    public String edita(@RequestParam("id") int id, Model model) {
        model.addAttribute("endereco", dao.buscarPorId(id));
        return "endereco/edita";
    }

    @RequestMapping(value = "/altera", method = RequestMethod.POST)
    public String altera(@Valid Endereco endereco, BindingResult result) {
        if (result.hasErrors()) {
            return "endereco/edita";
        }

        Endereco existingEndereco = dao.buscarPorId(endereco.getId());

        existingEndereco.setCep(endereco.getCep());
        existingEndereco.setEstado(endereco.getEstado());
        existingEndereco.setCidade(endereco.getCidade());
        existingEndereco.setBairro(endereco.getBairro());
        existingEndereco.setRua(endereco.getRua());
        existingEndereco.setNumero(endereco.getNumero());

        dao.altera(existingEndereco);

        return "redirect:lista";
    }

    @RequestMapping("/exibe")
    public String exibe(@RequestParam("id") int id, Model model) {
        model.addAttribute("endereco", dao.buscarPorId(id));
        return "endereco/exibe";
    }
}
