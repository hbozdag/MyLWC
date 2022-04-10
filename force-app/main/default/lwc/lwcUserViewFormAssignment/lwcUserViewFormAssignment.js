import { LightningElement, wire } from 'lwc';

import userID from '@salesforce/user/Id';
import userEmail from '@salesforce/schema/User.Email';
import userIsActive from '@salesforce/schema/User.isActive';
import userName from '@salesforce/schema/User.Name';
import {getRecord} from 'lightning/uiRecordApi';

export default class LwcUserViewFormAssignment extends LightningElement {


userIdField=userID;
userEmailField;
userNameField;
userIsActiveField;

@wire(getRecord, { recordId: userID, fields: [userEmail, userIsActive,userName]})

userFunction({error, data}){
    if(data){
        this.userEmailField=data.fields.Email.value;
        this.userNameField=data.fields.Name.value;
        this.userIsActiveField=data.fields.IsActive.value;
    }
else if (error){
    alert('User not selected');
}
}
}