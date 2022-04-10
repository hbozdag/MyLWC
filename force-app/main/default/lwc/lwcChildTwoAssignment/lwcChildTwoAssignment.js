import { LightningElement } from 'lwc';

export default class LwcChildTwoAssignment extends LightningElement {
    eventObject = {
        num: 0,
        ename: ''
    };

    handleNameChange(event) {
        this.eventObject.ename = event.detail.value;
    }

    handleNumberChange(event) {
        this.eventObject.num = event.detail.value;
    }

    handleClick() {
        this.dispatchEvent(
            new CustomEvent(
                'clicked2',
                { detail: this.eventObject }
            )
        );
    }

}