export class DetalleCarrito {
  public id: number;
  public cantidad: number;
  public idProducto: number;
  public idCarritoCompra: number;

  constructor(id: number, cantidad: number, idProducto: number, idCarritoCompra: number) {
    this.id = id;
    this.cantidad = cantidad;
    this.idProducto = idProducto;
    this.idCarritoCompra = idCarritoCompra;
  }
}