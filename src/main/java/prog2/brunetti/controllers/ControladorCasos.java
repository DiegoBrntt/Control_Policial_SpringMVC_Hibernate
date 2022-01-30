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
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import prog2.brunetti.repositories.RepoCasos;

@Controller
public class ControladorCasos {

    @Autowired
    private RepoCasos repoCasos;
    @Autowired
    private Controlador controlador;

    @PostMapping("/altaCaso")
    public String altaCaso(
            Model model,
            @RequestParam(value = "juez_encargado", required = true) Integer juez_id,
            @RequestParam(value = "fecha_caso", required = true) String fecha_caso,
            @RequestParam(value = "codigo_suc_caso", required = true) Integer codigo_suc,
            @RequestParam(value = "tiempo_condena", required = true) Integer tiempo_condena,
            @RequestParam(value = "condenados", required = false) List<Integer> condenados,
            @RequestParam(value = "condena", required = false ) Integer condena) {
        
        Integer condenaB;
        if (condena != null) {
            condenaB = 1;
        } else {
            condenaB = 0;
        }

        model.addAttribute("verificacionCasoAlta", repoCasos.altaCaso(codigo_suc, LocalDate.parse(fecha_caso), tiempo_condena, condenaB, juez_id, condenados));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }
    @PostMapping("/modificarCaso")
    public String modificarCaso(
            Model model,
            @RequestParam(value = "codigo_caso_mod", required = true) Integer codigo_caso,
            @RequestParam(value = "juez_encargado", required = true) Integer juez_id,
            @RequestParam(value = "fecha_caso", required = true) String fecha_caso,
            @RequestParam(value = "codigo_suc_caso", required = true) Integer codigo_suc,
            @RequestParam(value = "tiempo_condena", required = true) Integer tiempo_condena,
            @RequestParam(value = "condenados", required = false) List<Integer> condenados,
            @RequestParam(value = "condena", required = false ) Integer condena) {
        
        Integer condenaB;
        if (condena != null) {
            condenaB = 1;
        } else {
            condenaB = 0;
        }

        model.addAttribute("verificacionCasoMod", repoCasos.modificarCaso(codigo_caso, codigo_suc, LocalDate.parse(fecha_caso), tiempo_condena, condenaB, juez_id, condenados));
        controlador.cargarDatos(model);
        return controlador.mostrarMenuAdmin(model);
    }
    @PostMapping("/accionCaso")
    public String accionCaso(
            Model model,
            @RequestParam(value = "accion", required = true) String accion,
            @RequestParam(value = "accionCaso", required = true) Integer codigo_caso) {

        
        switch (accion) {
            case "Baja":
                model.addAttribute("verificacionCasoBaja", repoCasos.bajaCaso(codigo_caso));
                controlador.cargarDatos(model);
                return controlador.mostrarMenuAdmin(model);
            case "Modificar":
                model.addAttribute("caso", repoCasos.buscarCaso(codigo_caso));
                controlador.cargarDatos(model);
                return controlador.mostrarModificacion(model);
            default:
                return controlador.mostrarMenuAdmin(model);
        }

    }

   

}
