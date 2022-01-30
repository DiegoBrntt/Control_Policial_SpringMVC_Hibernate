/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.repositories;

import java.time.LocalDate;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import prog2.brunetti.controlPolicialSpringMVC.HibernateUtil;
import prog2.brunetti.entities.Contrato;
import prog2.brunetti.entities.Entidad;
import prog2.brunetti.entities.Sucursal;
import prog2.brunetti.entities.Usuario;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoContratos {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoContratos(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }
    
    public String altaContrato(Integer codigo_suc, LocalDate fecha_contratacion, Integer dias_contratados, Boolean armado, Integer codigo_vig) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Contrato con = Contrato.getInstance();
            
            con.setCodigo_suc(session.get(Sucursal.class, codigo_suc));
            LocalDate fechaC = con.getCodigo_suc().getFecha_contratacion();
            Integer frecue = con.getCodigo_suc().getFrecuencia_contratacion();

            int i = 0;
            if (fechaC.plusDays(frecue * i).isAfter(fecha_contratacion)) {
                while (fechaC.minusDays(frecue * i).isAfter(fecha_contratacion)) {
                    i++;
                }

                if (!fechaC.minusDays(frecue * i).isEqual(fecha_contratacion)) {
                    return "Fecha de contrato invalida para la sucursal deseada.";
                }

            }
            if (fechaC.plusDays(frecue * i).isBefore(fecha_contratacion)) {
                while (fechaC.plusDays(frecue * i).isBefore(fecha_contratacion)) {
                    i++;
                }

                if (!fechaC.plusDays(frecue * i).isEqual(fecha_contratacion)) {
                    return "Fecha de contrato invalida para la sucursal deseada.";
                }

            }
            
            con.setCodigo_vig(session.get(Usuario.class, codigo_vig));
            getContratosPorVigilante(con.getCodigo_vig().getUsuario_id());
            for (Contrato contrato : getContratos()) {
                if (contrato.coincideFechaVigilante(fecha_contratacion, codigo_vig)) {
                    return "El vigilante deseado ya esta contratado dicha fecha";
                }
            }
            
            con.setFecha_contratacion(fecha_contratacion);
            con.setDias_contratados(dias_contratados);
            con.setArmado(armado);
            if (fecha_contratacion.plusDays(dias_contratados).isBefore(LocalDate.now())) {
                con.setEstado(false);
            } else {
                con.setEstado(true);
            }

            session.save(con);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    public Contrato buscarContrato(Integer codigo_contrato) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Contrato con = session.get(Contrato.class, codigo_contrato);
            session.close();
            return con;
        } catch (Exception e) {
            return null;
        }
    }
    public String modificarContrato(Integer codigo_contrato, Integer codigo_suc, LocalDate fecha_contratacion, Integer dias_contratados, Boolean armado, Integer codigo_vig) {
    try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Contrato con = buscarContrato(codigo_contrato);
            
            con.setCodigo_suc(session.get(Sucursal.class, codigo_suc));
            LocalDate fechaC = con.getCodigo_suc().getFecha_contratacion();
            Integer frecue = con.getCodigo_suc().getFrecuencia_contratacion();

            int i = 0;
            if (fechaC.plusDays(frecue * i).isAfter(fecha_contratacion)) {
                while (fechaC.minusDays(frecue * i).isAfter(fecha_contratacion)) {
                    i++;
                }

                if (!fechaC.minusDays(frecue * i).isEqual(fecha_contratacion)) {
                    return "Fecha de contrato invalida para la sucursal deseada.";
                }

            }
            if (fechaC.plusDays(frecue * i).isBefore(fecha_contratacion)) {
                while (fechaC.plusDays(frecue * i).isBefore(fecha_contratacion)) {
                    i++;
                }

                if (!fechaC.plusDays(frecue * i).isEqual(fecha_contratacion)) {
                    return "Fecha de contrato invalida para la sucursal deseada.";
                }

            }
            
            con.setCodigo_vig(session.get(Usuario.class, codigo_vig));
            getContratosPorVigilante(con.getCodigo_vig().getUsuario_id());
            for (Contrato contrato : getContratos()) {
                if (contrato.coincideFechaVigilante(fecha_contratacion, codigo_vig) && !fecha_contratacion.isEqual(con.getFecha_contratacion())) {
                    return "El vigilante deseado ya esta contratado dicha fecha";
                }
            }
            
            con.setFecha_contratacion(fecha_contratacion);
            con.setDias_contratados(dias_contratados);
            con.setArmado(armado);
            if (fecha_contratacion.plusDays(dias_contratados).isBefore(LocalDate.now())) {
                con.setEstado(false);
            } else {
                con.setEstado(true);
            }

            session.update(con);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    public String bajaContrato(Integer codigo_contrato) {
    try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Contrato con = session.get(Contrato.class, codigo_contrato);
            session.delete(con);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Entidad ya existente";
        }    
    }

    public List<Contrato> getContratosPorVigilante(Integer codigoVigilante) {
        List<Contrato> contratosVigilante;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Contrato as contrato where"
                + " contrato.codigo_vig like '" + codigoVigilante + "'");
        contratosVigilante = query.getResultList();
        actualizarEstados(contratosVigilante);
        session.close();
        return contratosVigilante;
    }

    public List<Contrato> getContratos() {
        List<Contrato> contratos;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Contrato");
        contratos = query.getResultList();
        actualizarEstados(contratos);
        session.close();
        return contratos;
    }

    public List<Contrato> actualizarEstados(List<Contrato> contratos) {
        for (Contrato contrato : contratos) {
            if (contrato.getFecha_contratacion().plusDays(contrato.getDias_contratados()).isBefore(LocalDate.now())) {
                contrato.setEstado(false);
            } else {
                contrato.setEstado(true);
            }
        }
        return contratos;
    }

    
}
