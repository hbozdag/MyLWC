import { LightningElement } from 'lwc';

export default class LwcParentAssignment extends LightningElement {
    eventName;
    eventName2;

    handleButtonClicked(event) {
        this.eventName = 'Child Button Clicked';
    }

    handleButtonClicked2(event) {
        this.eventName2 = 'Child2 Button Clicked: ' + event.detail.ename + event.detail.num;
    }
}