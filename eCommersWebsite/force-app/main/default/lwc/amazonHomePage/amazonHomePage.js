import {  api, LightningElement, wire} from 'lwc';
import getProduct from '@salesforce/apex/contoller.getProduct';
import Amazon_Logo from '@salesforce/resourceUrl/amazonLogo';
import serachProds from '@salesforce/apex/contoller.retriveProducts';
import sortHightoLowPrice from '@salesforce/apex/contoller.sortHightoLowPrice';
import sortLowToHighPrice from '@salesforce/apex/contoller.sortLowToHighPrice';


export default class AmazonHomePage extends LightningElement {
    @wire (getProduct) product;
    @wire (sortHightoLowPrice) hightolow;
    @wire (sortLowToHighPrice) lowtohigh;
    @api searchData;
    @api strSearchProdName;
    productList;
    logo = Amazon_Logo ;
    visibleData;

    handleSearch(event) {
        this.strSearchProdName = event.detail.value;
        if(this.strSearchProdName != "" && this.strSearchProdName != null && this.strSearchProdName != undefined){
        serachProds({strProdName : this.strSearchProdName})
        .then(result => {
            this.searchData = result;
    }) 
    }
    else{
        this.searchData = null;
    }
}
    
    updateHandler(event){
    this.visibleData = [...event.detail.records];
    console.log(event.detail.records);
    }
   
    handlesorting(event){
        if(event.target.value == 'High'){
            this.visibleData = this.hightolow.data;
           
        }
        else{
            this.visibleData = this.lowtohigh.data;
    }
    
}   
        handleAddToCart(event){
            this.productList = event.detail.value;
            checkOpportunity({pro : this.productList})
            .then(getresult => {
            this.visibleData = getresult;
    }) 
}
    
}