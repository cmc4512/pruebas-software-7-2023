export class Envio {
   id: number;
   nombreProducto: string;
   direccion: string;
   cantidad:number;

   constructor(id: number, nombreProducto: string, direccion: string, cantidad: number) {
   this.id = id;
   this.nombreProducto = nombreProducto;
   this.direccion = direccion;
   this.cantidad = cantidad;
 }
}