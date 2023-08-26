import { Component, OnInit } from '@angular/core';
import { CarritoCompra } from '../entidades/Carrito-Compra';
import { CarritoCompraService } from '../servicios-backend/carrito-compra/carrito-compra.service';
import { HttpResponse } from '@angular/common/http';

@Component({
  selector: 'app-tab4',
  templateUrl: './tab4.page.html',
  styleUrls: ['./tab4.page.scss'],
})

export class Tab4Page {

public fecha = ""
public idusuario = ""
public cantidad = ""
public idproducto = ""


public listCarritoCompra: CarritoCompra[] = []

constructor(private carritoCompraService: CarritoCompraService) {
  

  this.GetAllFromBackend();

}
private GetAllFromBackend(){
  this.carritoCompraService.GetCarritoCompra().subscribe({
    next: (response: HttpResponse<any>) => {
        this.listCarritoCompra = response.body;
        console.log(this.listCarritoCompra)
    },
    error: (error: any) => {
        console.log(error);
    },
    complete: () => {
        
    },
});  
}

public addCarritoCompra(){
  this.AddCarritoCompraFromBackend(this.fecha, this.idusuario, this.cantidad, this.idproducto );
  

}
private AddCarritoCompraFromBackend(fecha: string, idusuario: string, cantidad: string, idproducto: string){

  var CarritoCompraEntidad = new CarritoCompra();
  CarritoCompraEntidad.fecha = fecha;
  CarritoCompraEntidad.idusuario = idusuario;
  CarritoCompraEntidad.cantidad = cantidad;
  CarritoCompraEntidad.idproducto = idproducto;

this.carritoCompraService.AddCarritoCompra(CarritoCompraEntidad).subscribe({
  next: (response: HttpResponse<any>) => {
      console.log(response.body)//1
      if(response.body == 1){
          alert("Se agrego el USUARIO con exito :)");
          this.getCarritoCompraFromBackend();//Se actualize el listado
          this.fecha = "";
          this.idusuario = "";
          this.cantidad= "";
          this.idproducto= "";

      }else{
          alert("Al agregar al  CarritoCompra fallo exito :(");
      }
  },
  error: (error: any) => {
      console.log(error);
  },
  complete: () => {
      console.log('complete - this.AddCarritoCompra()');
  },
});
}
  getCarritoCompraFromBackend() {
    throw new Error('Method not implemented.');
  }
}