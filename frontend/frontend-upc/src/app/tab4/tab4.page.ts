import { Component, OnInit } from '@angular/core';
import { CarritoCompra } from '../entidades/carrito-compra';
import { DetalleCarrito } from '../entidades/detalle-carrito';
import { CarritoCompraService } from '../servicios-backend/carrito-compra/carrito-compra.service';
import { DetalleCarritoService } from '../servicios-backend/detalle-carrito/detalle-carrito.service';
import { HttpResponse } from '@angular/common/http';

@Component({
  selector: 'app-tab4',
  templateUrl: 'tab4.page.html',
  styleUrls: ['tab4.page.scss']
})
export class Tab4Page {
  public fecha = '';
  public idUsuario = '';
  public listaCarrito: CarritoCompra[] = [];

  public cantidad = '';
  public idProducto = '';
  public idCarritoCompra = '';
  public listaDetalleCarrito: DetalleCarrito[] = [];

  constructor(private carritoCompraService: CarritoCompraService,
    private detalleCarritoService: DetalleCarritoService) {}

  ngOnInit() {
    this.getCarritoCompraFromBackend();
    this.getDetalleCarritoFromBackend();
  }
  private getCarritoCompraFromBackend() {
    this.carritoCompraService.GetAll().subscribe({
      next: (response: HttpResponse<any>) => {
        this.listaCarrito = response.body;
        console.log(this.listaCarrito)
      },
      error: (error: any) => {
        console.log(error);
      },
      complete: () => {
        //console.log('complete - this.getUsuarios()');
      },
    });
  }

  private getDetalleCarritoFromBackend() {
    this.detalleCarritoService.GetAll().subscribe({
      next: (response: HttpResponse<any>) => {
        this.listaDetalleCarrito = response.body;
        console.log(this.listaDetalleCarrito)
      },
      error: (error: any) => {
        console.log(error);
      },
      complete: () => {
        //console.log('complete - this.getUsuarios()');
      },
    });
  }


}