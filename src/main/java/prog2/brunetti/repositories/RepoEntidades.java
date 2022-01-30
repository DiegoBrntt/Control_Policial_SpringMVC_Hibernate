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
import prog2.brunetti.entities.Entidad;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoEntidades {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoEntidades(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }
    
    public String altaEntidad(String nombre_ent, String domicilio){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Entidad ent = Entidad.getInstance();
            ent.setNombre_ent(nombre_ent);
            ent.setDomicilio(domicilio);

            session.save(ent);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Entidad ya existente";
        }

    }
    public Entidad buscarEntidad(Integer entidad_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Entidad ent = session.get(Entidad.class, entidad_id);
            session.close();
            return ent;
        } catch (Exception e) {
            return null;
        }
    }
    public String modificarEntidad(Integer entidad_id, String nombre_ent, String domicilio){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Entidad ent = session.get(Entidad.class, entidad_id);
            ent.setNombre_ent(nombre_ent);
            ent.setDomicilio(domicilio);
            session.update(ent);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Error al tratar de modficar la entidad";
        }

    }
    public String bajaEntidad(Integer entidad_id) {
    try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Entidad ent = session.get(Entidad.class, entidad_id);
            session.delete(ent);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Entidad ya existente";
        }    
    }

    public List<Entidad> getEntidades() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Entidad");
        List<Entidad> entidades = query.getResultList();
        session.close();
        return entidades;
    }

}
