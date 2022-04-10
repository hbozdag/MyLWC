import { LightningElement} from 'lwc';
import caseObject from '@salesforce/schema/Case';
import subjectName from '@salesforce/schema/Case.Subject';
import accountId from '@salesforce/schema/Case.AccountId';
import descriptionName from '@salesforce/schema/Case.Description';

export default class LwcCaseEditViewAssignment extends LightningElement {
 recordId;

caseObjectName=caseObject;
caseSubject=subjectName;
caseAccount=accountId;
caseDescription=descriptionName;

handleSuccess(event) {

this.recordId=event.detail.id;
}


}