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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import prog2.brunetti.repositories.RepoBandas;
import prog2.brunetti.repositories.RepoJuzgados;

@Controller
public class ControladorJuzgados {

    @Autowired
    private RepoJuzgados repoJuzgados;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaJuzgado")
    public String altaJuzgado(
            Model model,
            @RequestParam(value = "numero_juzgado", required = true) Integer numero_juzgado) {

        model.addAttribute("verificacionJuzAlta", repoJuzgados.altaJuzgado(numero_juzgado));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

    @PostMapping("/accionJuzgado")
    public String accionJuzgado(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionJuzgado", required = true) Integer banda_id) {

        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionJuzBaja", repoJuzgados.bajaJuzgado(banda_id));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificar":
                model.addAttribute("juzgado", repoJuzgados.buscarJuzgado(banda_id));
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }

    }

    @PostMapping("/modificarJuzgado")
    public String modificarJuzgado(
            Model model,
            @RequestParam(value = "numeroJuzMod", required = true) Integer banda_id,
            @RequestParam(value = "numero_juzgado", required = true) Integer numero_juzgado) {

        model.addAttribute("verificacionJuzMod", repoJuzgados.modificarJuzgado(banda_id, numero_juzgado));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

}
