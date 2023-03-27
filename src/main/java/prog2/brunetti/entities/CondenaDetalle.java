/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import java.io.Serializable;
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
@Table(name="condena_det")
public class CondenaDetalle implements Serializable{

    public static CondenaDetalle getInstance() {
        return new CondenaDetalle();
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codigo_detalle;
    @ManyToOne
    @JoinColumn(name="codigo_caso")
    private Caso codigo_caso;
    @ManyToOne
    @JoinColumn(name="codigo_det")
    private Detenido codigo_det;
    
    public Boolean coincideCasoYDetenido(Detenido det, Caso caso){
       return codigo_det.equals(det) && codigo_caso.equals(caso);
    }
}
