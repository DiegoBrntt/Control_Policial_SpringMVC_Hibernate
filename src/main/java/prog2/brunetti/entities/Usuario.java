/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import java.io.Serializable;
import javax.persistence.Column;
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
@Table(name="usuarios")
public class Usuario implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer usuario_id;
    @Column(updatable = true)
    private String clave;
    private String pass;
    private Integer edad;
    private String tipo;

    public static Usuario getInstance(){
        return new Usuario();
    }
        
}
