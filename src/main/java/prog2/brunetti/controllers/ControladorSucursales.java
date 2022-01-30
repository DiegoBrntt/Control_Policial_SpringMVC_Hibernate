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
import prog2.brunetti.repositories.RepoSucursales;

@Controller
public class ControladorSucursales {

    @Autowired
    private RepoSucursales repoSucursales;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaSucursal")
    public String altaSucursal(
            Model model,
            @RequestParam(value = "codigo_ent_suc", required = true) Integer codigo_ent,
            @RequestParam(value = "fecha_cont_suc", required = true) String fecha_contrato,
            @RequestParam(value = "dias_cont_suc", required = true) Integer frecuencia_contratacion,
            @RequestParam(value = "empleados", required = true) Integer empleados,
            @RequestParam(value = "domicilio_suc", required = true) String domicilio) {

        model.addAttribute("verificacionSucAlta", repoSucursales.altaSucursal(codigo_ent, LocalDate.parse(fecha_contrato), frecuencia_contratacion, domicilio, empleados));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

    @PostMapping("/accionSucursal")
    public String accionEntidad(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionSuc", required = true) Integer codigo_suc) {

        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionSucBaja", repoSucursales.bajaSucursal(codigo_suc));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificar":
                model.addAttribute("sucursal", repoSucursales.buscarSucursal(codigo_suc));
                controlador.cargarDatos(model);
                return controlador.mostrarModificacion(model);
            default:
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
        }

    }

    @PostMapping("/modificarSucursal")
    public String modificarSucursal(
            Model model,
            @RequestParam(value = "codSuc", required = true) Integer codigo_suc,
            @RequestParam(value = "codigo_ent_suc", required = true) Integer codigo_ent,
            @RequestParam(value = "fecha_cont_suc", required = true) String fecha_contrato,
            @RequestParam(value = "dias_cont_suc", required = true) Integer frecuencia_contratacion,
            @RequestParam(value = "empleados", required = true) Integer empleados,
            @RequestParam(value = "domicilio_suc", required = true) String domicilio) {

        model.addAttribute("verificacionSucMod", repoSucursales.modificarSucursal(codigo_ent, codigo_suc, LocalDate.parse(fecha_contrato), frecuencia_contratacion, domicilio, empleados));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }

}
