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

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoBandas {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoBandas(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }
    
    public String altaBanda(String nombre_banda){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Banda ban = Banda.getInstance();
            ban.setNombre_banda(nombre_banda);

            session.save(ban);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Banda ya existente";
        }

    }
    public Banda buscarBanda(Integer banda_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Banda ent = session.get(Banda.class, banda_id);
            session.close();
            return ent;
        } catch (Exception e) {
            return null;
        }
    }
    public String modificarBanda(Integer banda_id, String nombre_banda) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Banda ban = buscarBanda(banda_id);
            ban.setNombre_banda(nombre_banda);

            session.update(ban);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Banda ya existente";
        }
    }
    public String bajaBanda(Integer banda_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            Banda ban = buscarBanda(banda_id);
            session.delete(ban);
            
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Banda ya existente";
        }
    }
    
    public List<Banda> getBandas() {
        List<Banda> bandas;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Banda d order by d.banda_id asc");
        bandas = query.getResultList();
        session.close();
        return bandas;
    }

    

    
    
}
