import { Component } from '@angular/core';
import { Producto } from '../entidades/producto';
import { HttpResponse } from '@angular/common/http';
import { ProductoService } from '../servicios-backend/producto/producto.service';
@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss']
})
export class Tab3Page {
  public nombre = "";
  public idCategoria = 0;
  
  public listaProductos: Producto[] = [];
  
  constructor(private productoService: ProductoService) {
    // let categoria = new Categoria();
    // categoria.nombreCategoria = "Nuevo Producto";

    // this.listaCategoria.push(categoria);
    this.getProducto();
  }

  public getProducto(){
    this.productoService.GetProductos().subscribe({
      next: (response: HttpResponse<any>) => {
        this.listaProductos = response.body;
      },
      error: (error: any) => {
        console.log(error);
      },
      complete: () => {
        
      }
    })
  }

  public addProducto(){
    this.AddProductoBackend(this.nombre, this.idCategoria);
  }

   private AddProductoBackend(nombre:string, idCategoria:number){

    var productoEntidad = new Producto();
    productoEntidad.nombre = nombre;
    productoEntidad.idCategoria = idCategoria;
    
      this.productoService.AddProducto(productoEntidad).subscribe({
        next: (response: HttpResponse<any>) => {
            console.log(response.body)//1
            if(response.body == 1){
                alert("Se agrego el producto con exito :)");
                this.getproductoFromBackend();//Se actualize el listado
                this.nombre = "";
            }else{
                alert("Al agregar el producto fallo exito :(");
            }
        },
        error: (error: any) => {
            console.log(error);
        },
        complete: () => {
            console.log('complete - this.AddProductoBackend()');
        },
    });
  }
  getproductoFromBackend() {
    throw new Error('Method not implemented.');
  }
}