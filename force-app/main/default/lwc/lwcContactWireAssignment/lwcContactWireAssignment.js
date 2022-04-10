import { LightningElement, wire } from 'lwc';
import fetchContactsJs from '@salesforce/apex/ContactController.fetchContacts';

export default class LwcContactWireAssignment extends LightningElement {
    @wire(fetchContactsJs)
    contacts;
}