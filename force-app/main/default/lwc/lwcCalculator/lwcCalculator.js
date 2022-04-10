import { LightningElement } from 'lwc';

export default class LwcCalculator extends LightningElement {
    num1 = 0.0;
    num2 = 0.0;
    result = 0.0;

    handleChangeNum1(event) {
      this.num1 = parseFloat(event.target.value).toFixed(2);
    }
    handleChangeNum2(event) {
      this.num2 = parseFloat(event.target.value).toFixed(2);
    }
    handleSum() {
        this.result = parseFloat(this.num1) + parseFloat(this.num2);
    }
    handleSubtract() {
        this.result = this.num1 - this.num2;
    }
    handleDivision() {
        this.result = (this.num1 / this.num2).toFixed(2);
    }
    handleMultiplication() {
        this.result = this.num1 * this.num2;
    }
    handleSquare() {
        this.result = this.num1 * this.num1;
    }
    handleExponential() {
        this.result = this.num1 ** this.num2;
    }
    handleRoot() {
        this.result = Math.sqrt(this.num1);
    }
}