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
@Table(name="contratos")
public class Contrato implements Serializable {

    public static Contrato getInstance() {
        return new Contrato();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codigo_contrato;
    private LocalDate fecha_contratacion;
    @ManyToOne
    @JoinColumn(name="codigo_suc")
    private Sucursal codigo_suc;
    @ManyToOne
    @JoinColumn(name="codigo_vig")
    private Usuario codigo_vig;
    private Integer dias_contratados;
    private Boolean armado;
    private Boolean estado;

    public boolean coincideFechaVigilante(LocalDate fecha_contratacion, Integer codigo_vig) {
        return this.fecha_contratacion.isEqual(fecha_contratacion) && this.codigo_vig.getUsuario_id().equals(codigo_vig);
    }

}
