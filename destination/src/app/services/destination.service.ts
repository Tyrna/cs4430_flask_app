import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { map, filter, scan } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class DestinationService {
  constructor(private http: HttpClient) {}

  getCities() {
    return this.http.get(`${environment.apiEndpoint}`).pipe(
      map(x =>
        x.map(y => {
          return { value: y[0], display: y[1] };
        })
      )
    );
  }

  getEndpoints(data) {
    return this.http.post(`${environment.apiEndpoint}`, data);
  }
}
