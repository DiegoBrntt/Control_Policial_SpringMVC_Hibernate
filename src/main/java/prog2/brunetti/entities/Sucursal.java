/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Grandalf
 */
@Data
@Entity
@Table(name = "sucursales")
public class Sucursal implements Serializable {

    public static Sucursal getInstance() {
        return new Sucursal();
    }
    
    @ManyToOne
    @JoinColumn(name="codigo_ent")
    private Entidad codigo_ent;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codigo_suc;

    private String domicilio;

    private Integer empleados;

    private LocalDate fecha_contratacion;

    private Integer frecuencia_contratacion;

}
