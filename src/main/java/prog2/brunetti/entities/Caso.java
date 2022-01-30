/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Grandalf
 */
@Data
@Entity
@Table(name="casos")
public class Caso implements Serializable{

    public static Caso getInstance() {
        return new Caso();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codigo_caso;
    private LocalDate fecha_caso;
    
    @ManyToOne
    @JoinColumn(name="juez_id")
    private Juez juez_id;
    
    @ManyToOne
    @JoinColumn(name="codigo_suc")
    private Sucursal codigo_suc;
    
    @OneToMany(mappedBy = "codigo_caso",cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<CondenaDetalle> condenados;
    
    private Integer condena;
    private Integer tiempo_condena;
}
