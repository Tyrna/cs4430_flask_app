import { Component, OnInit } from '@angular/core';
import { DestinationService } from './services/destination.service';

export interface Food {
  value: string;
  viewValue: string;
}
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'destination';
  citiesA: Array<any>;
  citiesB: Array<any>;
  cityA: any = '';
  cityB: any = '';
  destination: any;

  constructor(private destinationService: DestinationService) {}

  ngOnInit(): void {
    this.destinationService.getCities().subscribe(data => {
      console.log(data);
      this.citiesA = this.citiesB = data;
    });
  }

  onSelectChange(event) {
    console.log(this.cityA, this.cityB);
    if (!this.cityA || !this.cityB || this.cityA === this.cityB) {
      this.destination = null;
    } else {
      this.destinationService
        .getEndpoints({ city1: this.cityA, city2: this.cityB })
        .subscribe(data => {
          console.log(data);
          this.destination = data;
        });
    }
  }

  calculateTime(speed: number) {
    return Math.round(this.destination.distance / speed);
  }

  calculatePrice(price: number) {
    return Math.round(this.destination.distance / price);
  }
}
