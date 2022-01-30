/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Grandalf
 */
@Data
@Entity
@Table(name="bandas")
public class Banda implements Serializable{

    public static Banda getInstance() {
        return new Banda();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer banda_id;
    @Column(updatable = true)
    private String nombre_banda;
    
    @OneToMany(mappedBy = "codigo_banda",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Detenido> integrantes;
}

