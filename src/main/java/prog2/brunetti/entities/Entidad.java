/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;
/**
 *
 * @author Grandalf
 */
@Data
@Entity
@Table(name="entidades")
public class Entidad implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer entidad_id;
    
    @Column(updatable = true)
    private String nombre_ent;
    
    private String domicilio;
    
    @OneToMany(mappedBy = "codigo_ent",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Sucursal> sucursales;

    public static Entidad getInstance(){
        return new Entidad();
    }
}
