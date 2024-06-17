require "spec_helper"
require_relative "../lib/fluent_calculator"

describe FluentCalculator do
  
  # An array of operands, operation and the expected answer to loop through
  EXPECTATIONS = [
    ['zero', 'plus', 'two', 2],
    ['three', 'plus', 'five', 8],
    ['eight', 'minus', 'eight', 0],
    ['nine', 'minus', 'five', 4],
    ['zero', 'times', 'two', 0],
    ['two', 'times', 'two', 4],
    ['zero', 'divided_by', 'two', 0],
    ['four', 'divided_by', 'two', 2],
    ['three', 'divided_by', 'two', 1.5],
    ['seven', 'divided_by', 'zero', 'Please review your basic math skills!']
  ]

  # The following four tests show how to use the application
  it "should add two numbers" do
    expect(FluentCalculator.new.nine.plus.nine).to eq(18)
  end

  it "should subtract two numbers" do
    expect(FluentCalculator.new.one.minus.two).to eq(-1)
  end

  it "should multiply two numbers" do
    expect(FluentCalculator.new.three.times.zero).to eq(0)
  end

  it "should divide two numbers" do
    expect(FluentCalculator.new.five.divided_by.two).to eq(2.5)
  end

  # These specs do a more thourough testing of the application
  EXPECTATIONS.each do |k|
    it "should apply #{k[1]} on #{k[0]} and #{k[2]}" do
      expect(FluentCalculator.new.send(k[0]).send(k[1]).send(k[2])).to eq(k[3])
    end
  end

  # Below are the tests I wrote originally but decided to go with the code above. 
  # I commented them out to discuss the reasons on Wednesday

  # NUMBERS = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }
  # OPERATIONS = {
  #   plus: lambda {|op1, op2| op1 + op2}, 
  #   minus: lambda {|op1, op2| op1 - op2},
  #   times: lambda {|op1, op2| op1 * op2},
  #   divided_by: lambda {|op1, op2| op1 / op2.to_f}
  # }
  #
  # # These tests cover every possible combination
  # OPERATIONS.each do |op_name, op_func|
  #   NUMBERS.each do |k1, v1|
  #     NUMBERS.each do |k2, v2|
  #       if op_name == :divided_by && v2 == 0
  #         it "should handle division by zero" do
  #           expect(FluentCalculator.new.send(k1).send(op_name).send(k2)).to eq("Please review your basic math skills!")
  #         end
  #       else
  #         it "should apply #{op_name} on #{v1} and #{v2}" do
  #           expect(FluentCalculator.new.send(k1).send(op_name).send(k2)).to eq(op_func.call(v1, v2))
  #         end
  #       end
  #     end
  #   end
  # end

end