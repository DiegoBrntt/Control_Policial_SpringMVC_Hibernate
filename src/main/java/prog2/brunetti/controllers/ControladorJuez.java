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
import prog2.brunetti.repositories.RepoJueces;

@Controller
public class ControladorJuez {

    @Autowired
    private RepoJueces repoJueces;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaJuez")
    public String altaJuez(
            Model model,
            @RequestParam(value = "numero_juzgado_juez", required = true) Integer numero_juzgado,
            @RequestParam(value = "nombre_ape_juez", required = true) String nombre_ape,
            @RequestParam(value = "tiempo_servicio", required = true) Integer tiempo_servicio) {

        model.addAttribute("verificacionJuezAlta", repoJueces.altaJuez(numero_juzgado, nombre_ape, tiempo_servicio));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

    @PostMapping("/accionJuez")
    public String accionJuez(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionJuez", required = true) Integer juez_id) {

        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionJuezBaja", repoJueces.bajaJuez(juez_id));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificar":
                model.addAttribute("juez", repoJueces.buscarJuez(juez_id));
                controlador.cargarDatos(model);
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }

    }

    @PostMapping("/modificarJuez")
    public String modificarJuez(
            Model model,
            @RequestParam(value = "juez_id", required = true) Integer juez_id,
            @RequestParam(value = "numero_juzgado_juez", required = true) Integer numero_juzgado,
            @RequestParam(value = "nombre_ape_juez", required = true) String nombre_ape,
            @RequestParam(value = "tiempo_servicio", required = true) Integer tiempo_servicio) {

        model.addAttribute("verificacionJuezMod", repoJueces.modificarJuez(juez_id, nombre_ape, tiempo_servicio, numero_juzgado));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

}
