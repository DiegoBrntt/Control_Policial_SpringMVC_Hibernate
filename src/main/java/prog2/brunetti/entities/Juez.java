/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name="jueces")
public class Juez implements Serializable{

    public static Juez getInstance() {
        return new Juez();
    }
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer juez_id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "numero_juzgado")
    private Juzgado numero_juzgado;
    private String nombre_ape;
    private Integer años_serv;

}
