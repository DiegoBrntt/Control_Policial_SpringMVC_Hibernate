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
import java.time.LocalDate;
import prog2.brunetti.repositories.RepoUsuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ControladorUsuarios {

    @Autowired
    private RepoUsuarios repoUsuarios;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaUsuario")
    public String altaUsuario(
            Model model,
            @RequestParam(value = "nombreUsu", required = true) String clave,
            @RequestParam(value = "passUsu", required = true) String pass,
            @RequestParam(value = "edadUsu", required = true) String edad,
            @RequestParam(value = "tipoUsu", required = true) String tipo) {

        model.addAttribute("tablaUsu", true);
        model.addAttribute("verificacionUsuAlta", repoUsuarios.altaUsuario(clave, pass, LocalDate.parse(edad), tipo));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }
    @PostMapping("/modificarUsuario")
    public String modificarUsuario(
            Model model,
            @RequestParam(value = "nombreUsu", required = true) String clave,
            @RequestParam(value = "passUsu", required = true) String pass,
            @RequestParam(value = "edadUsu", required = true) String edad,
            @RequestParam(value = "tipoUsu", required = true) String tipo,
            @RequestParam(value = "nombreUsuMod", required = true) Integer usuario_id) {

        model.addAttribute("tablaUsu", true);
        model.addAttribute("verificacionUsuMod", repoUsuarios.modificacionUsuario(clave, pass, LocalDate.parse(edad), tipo, usuario_id));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }
    
    
    
    @PostMapping("/accionUsuario")
    public String accionUsuario(
            Model model,
            @RequestParam(value = "accionUsu", required = true) Integer usuario_id,
            @RequestParam(value = "accion", required = true) String accion) {

        switch(accion){
            case "Baja": 
            model.addAttribute("tablaUsu", true);
            model.addAttribute("verificacionUsuBaja", repoUsuarios.bajaUsuario(usuario_id));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificacion":
                model.addAttribute("usuarioMod", repoUsuarios.buscarUsuario(usuario_id));
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }
    }

}
