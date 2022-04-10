import { LightningElement, wire } from 'lwc';
import fetchCon from '@salesforce/apex/Contacts.fetchContact';
export default class LwcContactWire extends LightningElement {
    @wire(fetchCon)
    conList;
}