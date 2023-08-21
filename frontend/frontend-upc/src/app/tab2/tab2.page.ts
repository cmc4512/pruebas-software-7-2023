import { Component } from '@angular/core';
import { Producto } from '../entidades/producto';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {

  public Producto = ""
  public IdCategoria = ""
  public password = ""
  public Usuario = ""
  public Fecha = ""
  public Estado = ""

  public listaProducto: Producto[] = []

  constructor() {

    let producto: Producto = new Producto();
    producto.Producto = "computadora"
    producto.IdCategoria = "1"
    producto.Usuario = "jose"
    producto.Fecha = "12/02/2022"
    producto.Estado = "1"
   
    this.listaProducto.push(producto)
    this.listaProducto.push(producto)

  }


  public addProducto(){

  }

}