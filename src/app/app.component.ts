import { Component } from '@angular/core';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  template: `<h1>Public Key: {{ publicKey }}</h1>`,
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  publicKey = environment.publicKey;  // Access the public key from environment
}
