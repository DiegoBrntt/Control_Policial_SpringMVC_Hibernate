/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.repositories;

import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import prog2.brunetti.controlPolicialSpringMVC.HibernateUtil;
import prog2.brunetti.entities.Banda;
import prog2.brunetti.entities.Detenido;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoDetenidos {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoDetenidos(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }
    
    public String altaDetenido(Integer codigo_banda, String nombre_ape) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Detenido det = Detenido.getInstance();
            det.setCodigo_banda(session.get(Banda.class, codigo_banda));
            det.setNombre_ape(nombre_ape);

            session.save(det);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Detenido ya existente";
        }
    }
    public Detenido buscarDetenido(Integer codigo_det) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            Detenido det = session.get(Detenido.class, codigo_det);
            session.getTransaction().commit();
            session.close();
            return det;
        } catch (Exception e) {
            return null;
        }
    }
    
    public String bajaDetenido(Integer codigo_det) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            Detenido det = buscarDetenido(codigo_det);
            session.delete(det);
            
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Banda ya existente";
        }
    }
    public List<Detenido> getDetenidos() {
        List<Detenido> detenidos;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Detenido d order by d.codigo_banda asc");
        detenidos = query.getResultList();
        session.close();
        return detenidos;
    }

    public String modificarDetenido(Integer banda_id, Integer codigo_det, String nombre_ape) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Detenido det = session.get(Detenido.class, codigo_det);
            det.setCodigo_banda(session.get(Banda.class, banda_id));
            det.setNombre_ape(nombre_ape);

            session.update(det);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Detenido ya existente";
        }
    }

    

    

    
}
