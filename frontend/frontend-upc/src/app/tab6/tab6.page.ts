import { Component, OnInit } from '@angular/core';
import { Pedidos } from '../entidades/pedidos';
import { PedidosService } from '../servicios-backend/pedidos/pedidos.service';

@Component({
  selector: 'app-tab6',
  templateUrl: './tab6.page.html',
  styleUrls: ['./tab6.page.scss'],
})
export class Tab6Page {
  
  idUsuario: number | null = null;
  idEnvio: number | null = null;
  fechaPedido: string = '';
  estado: string = '';
  cantidad: string = '';

  
  listaPedidos: Pedidos[] = [];
  pedidosSeleccionado: Pedidos | null = null;


  constructor(private pedidosService: PedidosService) {}

  ngOnInit() {
    this.obtenerPedidos();
  }

  buscarYEditarPedidos(id: number) {
    this.obtenerPedidosPorId(id, );
    this.editarPedidos(this.pedidosSeleccionado!);
  }

  obtenerPedidos() {
    this.pedidosService.GetAll().subscribe(
      response => {
        this.listaPedidos = response.body;
      },
      error => {
        console.error('Error al obtener los pedidos:', error);
      }
    );
  }
  addPedidos() {
    const nuevoPedido: Pedidos = new Pedidos(0,
      this.idUsuario!,
      this.idEnvio!,
      new Date(this.fechaPedido),
      this.estado,
      this.cantidad,
      
    );
    this.pedidosService.Add(nuevoPedido).subscribe(
      response => {
        
        this.obtenerPedidos(); 
        console.log(response);
        alert('Pago del pedido realizado con éxito.');
      },
      error => {
        console.error(error);
      }
    );
  }
  obtenerPedidosPorId(id: number) {
    this.pedidosService.GetById(id).subscribe(
      response => {
      this.pedidosSeleccionado = response.body;
      console.log(response.body)
      },
      
      error => {
        console.error('Error al obtener  la cancelacion  de los pedidos:', error);
      }
    );
  }
  editarPedidos(pedidos: Pedidos) {
    this.pedidosSeleccionado = { ...pedidos };
  }

  guardarModificacionPedidos() {
    this.pedidosService.Update(this.pedidosSeleccionado!).subscribe(
      response => {
        alert('Pago de los pedidos modificado con éxito.');
        this.obtenerPedidos();
        this.cancelarModificacion();
      },
      error => {
        console.error('Error al modificar el pedido:', error);
      }
    );
  }

  eliminarPedidos(id: number) {
    this.pedidosService.Delete(id).subscribe(
      response => {
        alert('Pago de pedidos fue eliminado con éxito.');
        this.obtenerPedidos();
      },
      error => {
        console.error('Error al eliminar el pedido:', error);
      }
    );
  }

  cancelarModificacion() {
    this.pedidosSeleccionado = null;
  }

  limpiarCampos() {
    this.idUsuario = null;
    this.idEnvio = null;
    this.fechaPedido = '';
    this.estado = '';
    this.cantidad = '';
    
}
}