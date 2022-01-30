                                      /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.entities;

import static com.sun.tools.javac.tree.TreeInfo.name;
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
@Table(name="detenidos")
public class Detenido implements Serializable{

    public static Detenido getInstance() {
        return new Detenido();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codigo_det;
    @ManyToOne
    @JoinColumn(name="codigo_banda")
    private Banda codigo_banda;
    private String nombre_ape;

    
}
