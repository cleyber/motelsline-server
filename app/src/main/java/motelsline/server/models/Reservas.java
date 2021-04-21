/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.models;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author MotelsLine
 */
public class Reservas {
    private int id;
    private Date fecha;
    private int horasExtras;
    private int personasExtras;
    private ArrayList<Servicios> servicios;
    private Habitaciones habitacion;
    private Usuario usuario;

    public Reservas(){
        this.servicios = new ArrayList();
    }

    public Reservas(int id, Date fecha, int horasExtras, int personasExtras, ArrayList<Servicios> servicios, Habitaciones habitacion, Usuario usuario){
        this.id = id;
        this.fecha = fecha;
        this.horasExtras = horasExtras;
        this.personasExtras = personasExtras;
        this.servicios = servicios;
        this.habitacion = habitacion;
       this.usuario = usuario;
    }

    public void setId(int id){
        this.id = id;
    }

    public int getId(){
        return id;
    }

    public void setFecha(Date fecha){
        this.fecha = fecha;
    }

    public Date getFecha(){
        return fecha;
    }

    public void setHorasExtras(int horasExtras){
        this.horasExtras = horasExtras;
    }

    public int getHorasExtras(){
        return horasExtras;
    }

    public void setPersonasExtras(int personasExtras){
        this.personasExtras = personasExtras;
    }

    public int getPersonasExtras(){
        return personasExtras;
    }

    public void setServicios(ArrayList<Servicios> servicios) {
        this.servicios = servicios;
    }

    public ArrayList<Servicios> getServicios(){
        return servicios;
    }

    public void addServicios(Servicios servicio){
        this.servicios.add(servicio);
    }

    public void setHabitacion(Habitaciones habitacion){
        this.habitacion = habitacion;
    }

    public Habitaciones getHabitacion(){
        return habitacion;
    }

    public void setUsuario(Usuario usuario){
        this.usuario =  usuario;
    }

    public Usuario getUsuario(){
        return usuario;
    }
}
