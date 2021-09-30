import { LightningElement, track } from 'lwc';

export default class OrderHistoryPage extends LightningElement {

    @track clickedButtonLabel = 'Go to Order History';  
    @track boolVisible = false;  
  
    handleClick(event) {  
        const label = event.target.label;  
  
        if ( label === 'Go to Order History' ) {  
  
            this.clickedButtonLabel = 'Back to Home Page';  
            this.boolVisible = true;  
  
        } else if  ( label === 'Back to Home Page' ) {  
              
            this.clickedButtonLabel = 'Go to Order History';  
            this.boolVisible = false;  
  
        }  
}}