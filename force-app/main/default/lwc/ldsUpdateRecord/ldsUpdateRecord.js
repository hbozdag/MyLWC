import { LightningElement } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import ID_FIELD from '@salesforce/schema/Account.Id';
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class LdsUpdateRecord extends LightningElement {
    accountId;
    accountAnnualRevenue;

    handleIdChange(event) {
        this.accountId = event.detail.value;
    }
    handleRevenueChange(event) {
        this.accountAnnualRevenue = event.detail.value;
    }

    handleAccountSave() {
        const fields = {};
        fields[ID_FIELD.fieldApiName] = this.accountId;
        fields[ANNUAL_REVENUE_FIELD.fieldApiName] = this.accountAnnualRevenue;
        const accRecord = { fields };

        updateRecord(accRecord)
            .then(() => { 
                alert('Record updated');
            })
            .catch(() => { 
                alert('record update failed')
            })
    }
}