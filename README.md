Fluent Calculator

Two classes are implemented for this project: FluentCalculator and OperationHandler.

FluentCalculator keeps track of the first operand and the operation and returns the result when the method for the second operand is called.

The OperationHandler class contains the operation methods: plus, minus, times and divided_by. When the first operand method is called, the FluentCalculator sets the first_operand variable, then creates a new OperationHandler object and returns it. So the only methods available to the client afterwards are plus, minus, times and divided_by which prevents the client from entering invalid sequence of methods like: FluentCalculator.new.one.one 

The repetative methods in FluentCalculator and OperationHandler classes are created by define_method. I understand that using metaprogramming reduces the code's readability but in this case the methods are very simple and repetitive and I thought creating the methods this way shortens the code and removes the repetitions. 
