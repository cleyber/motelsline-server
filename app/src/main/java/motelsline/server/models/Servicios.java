package motelsline.server.models;

import java.util.ArrayList;



/**
 *
 * @author MotelsLine
 */
public class Servicios {
    private String nombre;
    private String descripcion;
    private String imagen;
    private double precio;
    private int id;
    private ArrayList<Imagen> imagenes;

    public Servicios(){
    }

    public Servicios(String nombre, String descripcion, String imagen, double precio, int id, ArrayList<Imagen> imagenes){
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.precio = precio;
        this.id = id;
        this.imagenes = imagenes;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public String getNombre(){
        return nombre;
    }

    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }

    public String getDescripcion(){
        return descripcion;
    }

    public void setPrecio(double precio){
        this.precio = precio;
    }

    public double getPrecio(){
        return precio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setImagenes(ArrayList<Imagen> imagenes){
        this.imagenes = imagenes;
    }

    public ArrayList<Imagen> getImagenes(){
        return imagenes;
    }

    public void addImagen(Imagen nombre){
        this.imagenes.add(nombre);
    }


}
