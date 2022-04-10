import { LightningElement } from 'lwc';

export default class LwcChildOneAssignment extends LightningElement {
    handleClick() {
        this.dispatchEvent(new CustomEvent('clicked'));
    }
}