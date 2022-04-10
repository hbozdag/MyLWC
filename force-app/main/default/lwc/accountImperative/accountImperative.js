import { LightningElement, track } from 'lwc';
import fetchAccountList from '@salesforce/apex/AccountImperative.fetchAccounts';
import fetchAccount from '@salesforce/apex/AccountImperative.fetchFirstAccount';
import updateAccountPhone from '@salesforce/apex/AccountImperative.updateAccountPhone';
export default class AccountImperative extends LightningElement {
    showAccounts=false;
    @track accountList;
    accountIdjs='';
    handleShowAccount() {
        fetchAccountList()
        .then((result) => {
        this.showAccounts = true;
        this.accountList=result;
        console.log(result);
        })
        .catch((error) => {
            alert('Error: '+error.body.message);
        })
}
handleHideAccount(){
    this.showAccounts=false;
    this.accountList=undefined;
}
handleAccountId(event){
    this.accountIdjs=event.detail.value;
}
handleFetchAccount(){
    fetchAccount({accountId: this.accountIdjs})
    .then((result) => {
        this.accountJs=result;
    })
    .catch((error) => {
        alert('Error: '+error.body.message);
    })
}
handleUpdateAccount(){
    let phoneInput = this.template.querySelector("lightning-input[data-name=accountphone]");
    this.accountJs.Phone=phoneInput.value;
    updateAccountPhone({acc: this.accountJs})
    .then((result)=>{
        alert(result);
    })
    .catch((error)=>{
        alert('Error: '+error.body.message);
    })
}
}