export class Pedidos{
  id: number;
  idUsuario: number;
  idEnvio: number;
  fechaPedido: Date;
  estado: string;
  cantidad: string;

  constructor(
    id: number,
    idUsuario: number,
    idEnvio: number,
    fechaPedido: Date,
    estado: string,
    cantidad: string,
  ) {

    this.id = id;
    this.idUsuario = idUsuario;
    this.idEnvio = idEnvio;
    this.fechaPedido = fechaPedido;
    this.estado = estado;
    this.cantidad = cantidad;
  }
}