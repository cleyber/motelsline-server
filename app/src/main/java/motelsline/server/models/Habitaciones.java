/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.models;

import java.util.ArrayList;

/**
 *
 * @author MotelsLine
 */
public class Habitaciones {
    private int id;
    private String nombre;
    private int cantidad;
    private String descripcion;
    private double precio;
    private int cantidadHoras;
    private double horaAdicional;
    private double personaAdicional;
    private ArrayList<Imagen> imagenes;

    public Habitaciones(){
    }

    public Habitaciones(int id, String nombre, int cantidad, String descripcion, double precio, int cantidadHoras, double horaAdicional, double personaAdicional, ArrayList<Imagen> imagenes) {
        this.id = id;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidadHoras = cantidadHoras;
        this.horaAdicional = horaAdicional;
        this.personaAdicional = personaAdicional;
        this.imagenes = imagenes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidadHoras() {
        return cantidadHoras;
    }

    public void setCantidadHoras(int cantidadHoras) {
        this.cantidadHoras = cantidadHoras;
    }

    public double getHoraAdicional() {
        return horaAdicional;
    }

    public void setHoraAdicional(double horaAdicional) {
        this.horaAdicional = horaAdicional;
    }

    public double getPersonaAdicional() {
        return personaAdicional;
    }

    public void setPersonaAdicional(double personaAdicional) {
        this.personaAdicional = personaAdicional;
    }

    public ArrayList<Imagen> getImagenes() {
        return imagenes;
    }

    public void setImagenes(ArrayList<Imagen> imagenes) {
        this.imagenes = imagenes;
    }

    public void addImagen(Imagen nombre){
        this.imagenes.add(nombre);
    }

}
