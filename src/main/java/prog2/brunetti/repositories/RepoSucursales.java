/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.repositories;

import java.time.LocalDate;
import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import prog2.brunetti.controlPolicialSpringMVC.HibernateUtil;
import prog2.brunetti.entities.Entidad;
import prog2.brunetti.entities.Sucursal;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoSucursales {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoSucursales(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }
    
    public String altaSucursal(Integer codigo_ent, LocalDate fecha_contrato, Integer frecuencia_contratacion, String domicilio, Integer empleados) {
    try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Sucursal suc = Sucursal.getInstance();
            suc.setCodigo_ent(session.get(Entidad.class, codigo_ent));
            suc.setFecha_contratacion(fecha_contrato);
            suc.setFrecuencia_contratacion(frecuencia_contratacion);
            suc.setDomicilio(domicilio);
            suc.setEmpleados(empleados);

            session.save(suc);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Sucursal ya existente";
        }
    }
    public Sucursal buscarSucursal(Integer codigo_suc) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Sucursal suc = session.get(Sucursal.class, codigo_suc);
            session.close();
            return suc;
        } catch (Exception e) {
            return null;
        }
    }
    public String modificarSucursal(Integer codigo_ent, Integer codigo_suc, LocalDate fecha_contrato, Integer frecuencia_contratacion, String domicilio, Integer empleados) {
    try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Sucursal suc = session.get(Sucursal.class, codigo_suc);
            suc.setCodigo_ent(session.get(Entidad.class, codigo_ent));
            suc.setFecha_contratacion(fecha_contrato);
            suc.setFrecuencia_contratacion(frecuencia_contratacion);
            suc.setDomicilio(domicilio);
            suc.setEmpleados(empleados);

            session.update(suc);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Sucursal ya existente";
        }
    }
    public String bajaSucursal(Integer codigo_suc) {
    try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Sucursal suc = buscarSucursal(codigo_suc);
            session.delete(suc);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Sucursal inexistente";
        }    
    }
    public List<Sucursal> getSucursales() {
        List<Sucursal> sucursales;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Sucursal as s order by s.codigo_ent asc");
        sucursales = query.getResultList();
        session.close();
        return sucursales;
    }

    

    
    
}
