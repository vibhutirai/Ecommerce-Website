import { LightningElement, wire } from 'lwc';
import getUser from '@salesforce/apex/contoller.getUser';
import getlistOfUsers from '@salesforce/apex/contoller.getlistOfUsers';

export default class ProfilePage extends LightningElement {
    isModalOpen = false;
    @wire (getUser) users;
    @wire (getlistOfUsers) userlist;
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    
}