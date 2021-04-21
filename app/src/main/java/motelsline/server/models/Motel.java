/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.models;

/**
 *
 * @author MotelsLine
 */
public class Motel {
    private int id;
    private String nombre;
    private String direccion;
    private String correo;
    private String telefono;

    public Motel(){
    }

    public Motel(int id, String nombre, String direccion, String correo, String telefono){
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
        this.correo = correo;
        this.telefono = telefono;
    }

    public void setId(int id){
        this.id = id;
    }

    public int getId(){
        return id;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public String getNombre(){
        return nombre;
    }

    public void setDireccion(String direccion){
        this.direccion = direccion;
    }

    public String getDireccion(){
        return direccion;
    }

    public void setCorreo(String correo){
        this.correo = correo;
    }

    public String getCorreo(){
        return correo;
    }

    public void setTelefono(String telefono){
        this.telefono = telefono;
    }

    public String getTelefono(){
        return telefono;
    }
}
