import { LightningElement , api } from 'lwc';

export default class LwcLifecycleParent extends LightningElement {

    privatePropertyParent = 'This is private in parent';
    @api publicPropertyParent = 'This is default public in parent';

    constructor() {
        super();
        console.log('----------------------------');
        console.log('Line 18 parent-> I am inside constructor');
        
        let childComponent = this.template.querySelector("c-lwc-lifecycle-child");
        console.log('Line 21 parent-> childComponent', childComponent);

        console.log('Line 23 parent-> publicPropertyParent: ', this.publicPropertyParent);
        console.log('Line 24 parent-> privatePropertyParent: ', this.privatePropertyParent);
    }

    connectedCallback() {
        console.log('----------------------------');
        console.log('Line 29 parent-> This is connected callback');
        let childComponent = this.template.querySelector("c-lwc-lifecycle-child");
        console.log('Line 31 parent-> childComponent', childComponent);
        console.log('Line 32 parent-> publicPropertyParent: ', this.publicPropertyParent);
    }

    renderedCallback() {
        console.log('----------------------------');
        console.log('Line 37 parent-> This is renderedCallback');
        let childComponent = this.template.querySelector("c-lwc-lifecycle-child");
        console.log('Line 39 parent-> childComponent', childComponent);
    }

    disconnectedCallback() {
        console.log('----------------------------');
        console.log('Line 44 parent-> This is disconnectedCallback in parent'); 
    }
}