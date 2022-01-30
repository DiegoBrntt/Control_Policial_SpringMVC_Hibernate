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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import prog2.brunetti.repositories.RepoContratos;
import prog2.brunetti.repositories.RepoSucursales;

@Controller
public class ControladorContratos {

    @Autowired
    private RepoContratos repoContratos;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaContrato")
    public String altaContrato(
            Model model,
            @RequestParam(value = "codigo_suc_con", required = true) Integer codigo_suc,
            @RequestParam(value = "fecha_contrato", required = true) String fecha_contratacion,
            @RequestParam(value = "dias_contrato", required = true) Integer dias_contratados,
            @RequestParam(value = "codigo_vig_con", required = true) Integer codigo_vig,
            @RequestParam(value = "armado", required = false ) Integer armado) {
        
        Boolean armadoB;
        if (armado != null) {
            armadoB = true;
        } else {
            armadoB = false;
        }

        model.addAttribute("verificacionConAlta", repoContratos.altaContrato(codigo_suc, LocalDate.parse(fecha_contratacion), dias_contratados, armadoB, codigo_vig));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }
    @PostMapping("/modificarContrato")
    public String modificarContrato(
            Model model,
            @RequestParam(value = "codigoConMod", required = true) Integer codigo_contrato,
            @RequestParam(value = "codigo_suc_con", required = true) Integer codigo_suc,
            @RequestParam(value = "fecha_contrato", required = true) String fecha_contratacion,
            @RequestParam(value = "dias_contrato", required = true) Integer dias_contratados,
            @RequestParam(value = "codigo_vig_con", required = true) Integer codigo_vig,
            @RequestParam(value = "armado", required = false ) Integer armado) {
        
        Boolean armadoB;
        if (armado != null) {
            armadoB = true;
        } else {
            armadoB = false;
        }

        model.addAttribute("verificacionConMod", repoContratos.modificarContrato(codigo_contrato ,codigo_suc, LocalDate.parse(fecha_contratacion), dias_contratados, armadoB, codigo_vig));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }
    @PostMapping("/accionContrato")
    public String accionContrato(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionCon", required = true) Integer codigo_contrato) {

        
        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionConBaja", repoContratos.bajaContrato(codigo_contrato));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificar":
                model.addAttribute("contrato", repoContratos.buscarContrato(codigo_contrato));
                controlador.cargarDatos(model);
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }

    }

   

}
