import { Component, OnInit } from '@angular/core';
import {Envio } from '../entidades/envio';
import { EnvioService } from '../servicios-backend/envio/envio.service';

@Component({
  selector: 'app-tab5',
  templateUrl: './tab5.page.html',
  styleUrls: ['./tab5.page.scss'],
})

export class Tab5Page implements OnInit {
  nombreProducto: string = '';
  direccion: string = '';
  cantidad: number | null = null;

  listaEnvio: Envio[] = [];
  envioSeleccionado: Envio | null = null;

  constructor(private envioService: EnvioService) {}

  ngOnInit() {
    this.getEnvio();
  }

  getEnvio() {
   this.envioService.GetAll().subscribe(
      response => {
       this.listaEnvio = response.body;
     },
      error => {
      console.error('Error al obtener los envio:', error);
      }
   );
}

  addEnvio() {
    if (this.nombreProducto && this.direccion && this.cantidad !== null) {
      const nuevoEnvio = new Envio (0, this.nombreProducto, this.direccion, this.cantidad)
      this.envioService.Add(nuevoEnvio).subscribe(
        response => {
          console.log('Envio agregado:', response.body);
          this.getEnvio(); 
        },
        error => {
          console.error('Error al agregar envio:', error);
        }
      );
    }
  }

  obtenerId(id: number) {
    this.envioService.GetById(id).subscribe(
      response => {
        this.envioSeleccionado = response.body; 
      },
      error => {
        console.error('Error al obtener la envio por ID:', error);
      }
    );
  }
  editarEnvio(envio: Envio) {
    this.envioSeleccionado = envio; 
  }

  guardarModificacionEnvio() {
    if (this.envioSeleccionado) {
      this.envioService.Update(this.envioSeleccionado).subscribe(
        response => {
          console.log('Envio modificado:', response.body);
          this.getEnvio();
          this.envioSeleccionado = null; 
          alert('Envio modificado con éxito.');
        },
        error => {
          console.error('Error al modificar envio:', error);
        }
      );
    }
  }
  cancelarModificacion() {
    this.envioSeleccionado = null; 
  }

  eliminarEnvio(id: number) {
    console.log(id)
    this.envioService.Delete(id).subscribe(
      response => {
        console.log('Envio eliminado:', response.body);
        this.getEnvio(); 
        alert('Envio eliminado con éxito.');
      },
      error => {
        console.error('Error al eliminar envio:', error);
        alert('Error al eliminar envio.');
      }
    );
  }
}