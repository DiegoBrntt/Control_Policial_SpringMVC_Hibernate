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
@Table(name="juzgados")
public class Juzgado implements Serializable{

    public static Juzgado getInstance() {
        return new Juzgado();
    }
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer juzgado_id;
    @Column(updatable = true)
    private Integer numero_juzgado;
    @OneToMany(mappedBy = "numero_juzgado",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Juez> jueces;

}
