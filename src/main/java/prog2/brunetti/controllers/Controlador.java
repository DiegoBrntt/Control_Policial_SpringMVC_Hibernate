/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.controllers;

/**
 *
 * @author Grandalf
 */
import prog2.brunetti.repositories.RepoUsuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import prog2.brunetti.repositories.*;

@Controller
public class Controlador {

    @Autowired
    private RepoUsuarios repoUsuarios;
    @Autowired
    private RepoEntidades repoEntidades;
    @Autowired
    private RepoSucursales repoSucursales;
    @Autowired
    private RepoContratos repoContratos;
    @Autowired
    private RepoBandas repoBandas;
    @Autowired
    private RepoDetenidos repoDetenidos;
    @Autowired
    private RepoJuzgados repoJuzgados;
    @Autowired
    private RepoJueces repoJueces;
    @Autowired
    private RepoCasos repoCasos;

    @GetMapping("/")
    public String mostrarInicio(Model model) {
        return "index";
    }

    @GetMapping("/menuAdministrador")
    public String mostrarMenuAdmin(Model model) {
        return "vistaResultadoAdministrador";
    }

    @GetMapping("/menuInvestigador")
    public String mostrarMenuInvest(Model model) {
        return "vistaResultadoInvestigador";
    }

    @GetMapping("/menuVigilante")
    public String mostrarMenuVigi(Model model) {
        return "vistaResultadoVigilante";
    }

    @GetMapping("/modificacion")
    public String mostrarModificacion(Model model) {
        return "vistaModificacion";
    }

    @PostMapping("/changeInv")
    public String cambioTabla(
            Model model,
            @RequestParam(value = "change", required = true) String change) {

        switch (change) {
            /* Casos de investigador */
            case "entidades":
                cargarDatos(model);
                model.addAttribute("tablaEnt", true);
                return mostrarMenuInvest(model);

            case "sucursales":
                cargarDatos(model);
                model.addAttribute("tablaSuc", true);
                return mostrarMenuInvest(model);
            case "contratos":
                cargarDatos(model);
                model.addAttribute("tablaCon", true);
                return mostrarMenuInvest(model);
            case "detenidos":
                cargarDatos(model);
                model.addAttribute("tablaDet", true);
                return mostrarMenuInvest(model);
            case "jueces":
                cargarDatos(model);
                model.addAttribute("tablaJue", true);
                return mostrarMenuInvest(model);
            case "delitos":
                cargarDatos(model);
                model.addAttribute("tablaDel", true);
                return mostrarMenuInvest(model);

            default:
                return mostrarInicio(model);

        }
    }

    @PostMapping("/changeAdm")
    public String cambioForm(
            Model model,
            @RequestParam(value = "change", required = true) String change) {

        switch (change) {
            case "usuarios":
                cargarDatos(model);
                model.addAttribute("tablaUsu", true);
                return mostrarMenuAdmin(model);
            case "entidades":
                cargarDatos(model);
                model.addAttribute("tablaEnt", true);
                return mostrarMenuAdmin(model);

            case "sucursales":
                cargarDatos(model);
                model.addAttribute("tablaSuc", true);
                return mostrarMenuAdmin(model);
            case "contratos":
                cargarDatos(model);
                model.addAttribute("tablaCon", true);
                return mostrarMenuAdmin(model);
            case "detenidos":
                cargarDatos(model);
                model.addAttribute("tablaDet", true);
                return mostrarMenuAdmin(model);
            case "jueces":
                cargarDatos(model);
                model.addAttribute("tablaJue", true);
                return mostrarMenuAdmin(model);
            case "delitos":
                cargarDatos(model);
                model.addAttribute("tablaDel", true);
                return mostrarMenuAdmin(model);

            default:
                return mostrarInicio(model);

        }
    }

    @PostMapping("/validarUsuario")
    public String validarUsuario(
            Model model,
            @RequestParam(value = "clave", required = true) String clave,
            @RequestParam(value = "pass", required = true) String pass) {

        repoUsuarios.validarUsuario(clave, pass);
        cargarDatos(model);
        switch (repoUsuarios.getUsuarioValido().getTipo()) {
            case "Administrador":
                return mostrarMenuAdmin(model);
            case "Investigador":
                return mostrarMenuInvest(model);
            case "Vigilante":
                model.addAttribute("contratosVigilante",
                        repoContratos.getContratosPorVigilante(repoUsuarios.getUsuarioValido().getUsuario_id()));
                return mostrarMenuVigi(model);
            default:
                return mostrarInicio(model);

        }
    }

    public void cargarDatos(Model model) {
        repoUsuarios.consultarUsuarios();
        model.addAttribute("usuario", repoUsuarios.getUsuarioValido());
        model.addAttribute("usuarios", repoUsuarios.getUsuarios());
        model.addAttribute("vigilantes", repoUsuarios.getVigilantes());
        model.addAttribute("entidades", repoEntidades.getEntidades());
        model.addAttribute("sucursales", repoSucursales.getSucursales());
        model.addAttribute("contratos", repoContratos.getContratos());
        model.addAttribute("detenidos", repoDetenidos.getDetenidos());
        model.addAttribute("bandas", repoBandas.getBandas());
        model.addAttribute("juzgados", repoJuzgados.getJuzgados());
        model.addAttribute("jueces", repoJueces.getJueces());
        model.addAttribute("casos", repoCasos.getCasos());
    }
}
