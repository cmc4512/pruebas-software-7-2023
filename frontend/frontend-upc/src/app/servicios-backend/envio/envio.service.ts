import { HttpClient, HttpParams, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Envio } from 'src/app/entidades/envio';

@Injectable({
  providedIn: 'root'
})
export class EnvioService {
  PATH_BACKEND = "http://localhost:" + "5159"

  URL_GET = this.PATH_BACKEND + "/api/Envio/GetAllEnvio";
  URL_GET_BY_ID = this.PATH_BACKEND + "/api/Envio/GetEnvioById";
  URL_ADD_ENVIO = this.PATH_BACKEND + "/api/Envio/AddEnvio";
  URL_UPDATE_ENVIO = this.PATH_BACKEND + "/api/Envio/UpdateEnvio";
  URL_DELETE_ENVIO = this.PATH_BACKEND + "/api/Envio/DeleteEnvio";

  constructor(private httpClient: HttpClient) {
  }

  public GetAll(): Observable<HttpResponse<any>> {
    return this.httpClient
      .get<any>(this.URL_GET,
        { observe: 'response' })
      .pipe();
  }

  public GetById(id: number): Observable<HttpResponse<any>> {
    var parametros = new HttpParams()
    parametros = parametros.set('id',id)
    return this.httpClient
      .get<any>(this.URL_GET_BY_ID,
        { params: parametros, observe: 'response' })
      .pipe();
  }

  public Add(entidad: Envio): Observable<HttpResponse<any>> {
    return this.httpClient
      .post<any>(this.URL_ADD_ENVIO, entidad,
        { observe: 'response' })
      .pipe();
  }

  public Update(entidad: Envio): Observable<HttpResponse<any>> {
    return this.httpClient
      .post<any>(this.URL_UPDATE_ENVIO, entidad,
        { observe: 'response' })
      .pipe();
  }

  public Delete(id: number): Observable<HttpResponse<any>> {
    const params = { id: id.toString() };
    return this.httpClient
      .delete<any>(this.URL_DELETE_ENVIO,
        { params: params, observe: 'response' })
      .pipe();
  }
}