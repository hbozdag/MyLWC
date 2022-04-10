public with sharing class Calculator {
    //perform addition of two numbers
    public static Double addition(Double num1, Double num2) {
        calculatorServices.CalculatorImplPort calculator=
    new calculatorServices.CalculatorImplPort();
return calculator.doAdd(num1, num2);

    }

    public static Double multiply(Double num1, Double num2) {
        calculatorServices.CalculatorImplPort calculator=
    new calculatorServices.CalculatorImplPort();
return calculator.doMultiply(num1, num2);

    }
    public static Double subtract(Double num1, Double num2) {
        calculatorServices.CalculatorImplPort calculator=
    new calculatorServices.CalculatorImplPort();
return calculator.doSubtract(num1, num2);

    }
    public static Double division(Double num1, Double num2) {
        calculatorServices.CalculatorImplPort calculator=
    new calculatorServices.CalculatorImplPort();
return calculator.doDivide(num1, num2);

    }
}
