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
import prog2.brunetti.repositories.RepoDetenidos;

@Controller
public class ControladorDetenidos {

    @Autowired
    private RepoDetenidos repoDetenidos;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaDetenido")
    public String altaDetenido(
            Model model,
            @RequestParam(value = "codigo_banda", required = true) Integer codigo_banda,
            @RequestParam(value = "nombre_ape_det", required = true) String nombre_ape) {

        model.addAttribute("verificacionDetAlta", repoDetenidos.altaDetenido(codigo_banda, nombre_ape));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

    @PostMapping("/accionDetenido")
    public String accionDetenido(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionDetenido", required = true) Integer codigo_det) {

        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionDetBaja", repoDetenidos.bajaDetenido(codigo_det));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificar":
                model.addAttribute("detenido", repoDetenidos.buscarDetenido(codigo_det));
                controlador.cargarDatos(model);
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }

    }

    @PostMapping("/modificarDetenido")
    public String modificarDetenido(
            Model model,
            @RequestParam(value = "codigo_banda", required = true) Integer banda_id,
            @RequestParam(value = "codigoDetMod", required = true) Integer codigo_det,
            @RequestParam(value = "nombre_ape_det", required = true) String nombre_ape) {

        model.addAttribute("verificacionDetMod", repoDetenidos.modificarDetenido(banda_id, codigo_det, nombre_ape));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

}
