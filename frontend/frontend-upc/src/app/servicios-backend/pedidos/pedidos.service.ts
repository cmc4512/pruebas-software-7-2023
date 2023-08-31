import { HttpClient, HttpParams, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, identity } from 'rxjs';
import { Pedidos } from 'src/app/entidades/pedidos';

@Injectable({
  providedIn: 'root'
})
export class PedidosService {
  PATH_BACKEND = "http://localhost:" + "5159"

  URL_GET = this.PATH_BACKEND + "/api/Pedido/GetAllPedido";
  URL_GET_BY_ID = this.PATH_BACKEND + "/api/Pedido/GetPedidosById";
  URL_ADD_PEDIDOS = this.PATH_BACKEND + "/api/Pedido/AddPedido";
  URL_UPDATE_PEDIDOS = this.PATH_BACKEND + "/api/Pedido/UpdatePedido";
  URL_DELETE_PEDIDOS = this.PATH_BACKEND + "/api/Pedido/DeletePedido";

  constructor(private httpClient: HttpClient) {
  }

  public GetAll(): Observable<HttpResponse<any>> {
    return this.httpClient
      .get<any>(this.URL_GET,
        { observe: 'response' })
      .pipe();
  }
  public GetById(id: number): Observable<HttpResponse<any>> {

    console.log(id)

    var parametros = new HttpParams()
    parametros = parametros.set('id',id)

    return this.httpClient
      .get<any>(this.URL_GET_BY_ID,
        { params: parametros, observe: 'response' })
      .pipe();
  }
  public Add(entidad: Pedidos): Observable<HttpResponse<any>> {
    return this.httpClient
      .post<any>(this.URL_ADD_PEDIDOS, entidad,
        { observe: 'response' })
      .pipe();
  }
  public Update(entidad: Pedidos): Observable<HttpResponse<any>> {
    return this.httpClient
      .post<any>(this.URL_UPDATE_PEDIDOS, entidad,
        { observe: 'response' })
      .pipe();
  }
  public Delete(id: number): Observable<HttpResponse<any>> {
    return this.httpClient
      .delete<any>(`${this.URL_DELETE_PEDIDOS}?id=${id}`,
        { observe: 'response' })
      .pipe();
  }
}