import { LightningElement,wire } from 'lwc';
import searchCon from '@salesforce/apex/AccountSearchController.searchContact';

export default class LwcContactSearch extends LightningElement {
    enteredValue='';
    keywordsJS = '';
    @wire(searchCon,{keyword:'$keywordsJS'})
    conList;
    handleSearchText(event) {
        this.enteredValue = event.detail.value;
    }
    handleSearchContacts() {
        //Update to keywordJS will reinvoke the wire method as keywordJS is associated with Wire
        this.keywordsJS = this.enteredValue;
    }

}