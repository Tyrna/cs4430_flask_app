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
  foods: Food[] = [
    { value: 'steak-0', viewValue: 'Steak' },
    { value: 'pizza-1', viewValue: 'Pizza' },
    { value: 'tacos-2', viewValue: 'Tacos' }
  ];

  constructor(private destinationService: DestinationService) {}
  ngOnInit(): void {
    this.destinationService.getCities().subscribe(data => console.log(data));
    this.destinationService
      .getEndpoints({ city1: 'A', city2: 'B' })
      .subscribe(data => console.log(data));
  }
}
