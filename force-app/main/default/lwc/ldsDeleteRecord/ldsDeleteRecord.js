import { LightningElement } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';

export default class LdsDeleteRecord extends LightningElement {
    accountId;

    handleIdChange(event) {
        this.accountId = event.detail.value;
    }

    handleAccountDelete() {

        deleteRecord(this.accountId)
            .then(() => { 
                alert('Record deleted');
            })
            .catch(() => { 
                alert('record delete failed')
            })
    }
}