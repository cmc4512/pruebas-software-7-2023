import { Injectable } from '@angular/core';
import{HttpClient, HttpResponse} from '@angular/common/http'
import { Observable, Observer } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

PATH_BACKEND="http://localhost:5159/api/Producto/"
GET_ALL= this.PATH_BACKEND+"GetAllProducto"
  constructor(private httpClient:HttpClient) { }

  public GetAllProductos():Observable<HttpResponse<any>>{
    return this.httpClient.get<any>(this.GET_ALL, {observe:'response'}).pipe();
  }
}