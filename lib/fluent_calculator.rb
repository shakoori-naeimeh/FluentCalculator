class FluentCalculator

  attr_accessor :operator, :first_operand

  def initialize
    @first_operand = nil
    @operator = nil
  end

  NUMBERS = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }

  # This for loop creates a function for each number. It's the same as writing a 
  # function like the example below for each number:
  # def one
  #   process_operand(NUMBERS[:one])
  # end
  NUMBERS.each_key do |key|
    define_method "#{key}" do
      process_operand(NUMBERS[key])
    end
  end

  # Sets first_operand and operator, otherwise applies the operation 
  def process_operand(number)
    unless operator
      @first_operand = number
      OperationHandler.new(self)
    else
       applyOperation(number)
    end
  end

  # Applies the operation to operands
  def applyOperation(second_operand)
    operator.call(first_operand, second_operand)
  end

  # Operation is created as a separate class inside FluentCalcurator to prevent invalid sequence of function calls
  class OperationHandler
    OPERATIONS = {
      plus: lambda {|op1, op2| op1 + op2}, 
      minus: lambda {|op1, op2| op1 - op2},
      times: lambda {|op1, op2| op1 * op2},
      divided_by: lambda {|op1, op2| op2 == 0 ? "Please review your basic math skills!" : op1 / op2.to_f}
    }
    
    attr_accessor :calculator
  
    def initialize(calculator)
      @calculator = calculator
    end
    
    # This for loop creates a function for each operation. It's the same as writing a 
    # function like the example below for each number:
    # def plus
    #   calculator.operator = OPERATIONS[:plus]
    #   calculator
    # end
    OPERATIONS.each do |operation_name, operation_function|
      define_method "#{operation_name}" do
        calculator.operator = operation_function
        calculator
      end
    end
  end

end