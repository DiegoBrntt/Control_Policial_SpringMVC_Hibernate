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

@Controller
public class ControladorBandas {

    @Autowired
    private RepoBandas repoBandas;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaBanda")
    public String altaBanda(
            Model model,
            @RequestParam(value = "nombre_banda", required = true) String nombre_banda) {

        model.addAttribute("verificacionBanAlta", repoBandas.altaBanda(nombre_banda));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

    @PostMapping("/accionBanda")
    public String accionBanda(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionBanda", required = true) Integer banda_id) {

        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionBanBaja", repoBandas.bajaBanda(banda_id));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificar":
                model.addAttribute("banda", repoBandas.buscarBanda(banda_id));
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }

    }

    @PostMapping("/modificarBanda")
    public String modificarBanda(
            Model model,
            @RequestParam(value = "codigoBanMod", required = true) Integer banda_id,
            @RequestParam(value = "nombre_banda", required = true) String nombre_banda) {

        model.addAttribute("verificacionBanMod", repoBandas.modificarBanda(banda_id, nombre_banda));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

}
