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
import prog2.brunetti.repositories.RepoEntidades;

@Controller
public class ControladorEntidades {

    @Autowired
    private RepoEntidades repoEntidades;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaEntidad")
    public String altaEntidad(
            Model model,
            @RequestParam(value = "nombreEnt", required = true) String nombre_ent,
            @RequestParam(value = "central", required = true) String domicilio) {

        model.addAttribute("verificacionEntAlta", repoEntidades.altaEntidad(nombre_ent, domicilio));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

    @PostMapping("/accionEntidad")
    public String accionEntidad(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionEnt", required = true) Integer codigoEnt) {

        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionEntBaja", repoEntidades.bajaEntidad(codigoEnt));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificacion":
                model.addAttribute("entidad", repoEntidades.buscarEntidad(codigoEnt));
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }

    }

    @PostMapping("/modificarEntidad")
    public String modificarEntidad(
            Model model,
            @RequestParam(value = "entidad_id", required = true) Integer entidad_id,
            @RequestParam(value = "nombre_ent", required = true) String nombre_ent,
            @RequestParam(value = "domicilio", required = true) String domicilio) {

        model.addAttribute("verificacionEntMod", repoEntidades.modificarEntidad(entidad_id, nombre_ent, domicilio));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

}
