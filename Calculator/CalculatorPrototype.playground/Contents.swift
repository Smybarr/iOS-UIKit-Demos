import UIKit

var str = "Calculator Prototype Playground"


enum OperatorType {
    case Addition
    case Subtraction
    case Multiply
    case Divide
    case Equals
}


var operandSet:[Float] = [];
var operatorSet:[OperatorType] = [];

func UpdateOperandSet(newOperand:Float) {
    
    operandSet.append(newOperand)
}


func PressEqualsButton() {
    operatorSet.append(.Equals)
    UpdateOperandSet(newOperand: 0.0)
}

func InterpretAndPerformOperation(operatorEnum: OperatorType, currVal: Float, rVal: Float = 0.0) -> Float {
    
    //store the currVal as a variable for modification
    var result = currVal
    
    switch operatorEnum {
    case .Addition:
        //take left and right value, add then set result to return
        result += rVal
        return result
    case .Subtraction:
        result -= rVal
        return result
    case .Multiply:
        result *= rVal
        return result;
    case .Divide:
        result /= rVal
        return result;
    case .Equals:
        
        return result
    default:
        //default just returns the current value
        return result
    }
}


//load the containers with known values - keep a 2:1 operator/operand ratio


UpdateOperandSet(newOperand: 1.0)

operatorSet.append(.Addition)

UpdateOperandSet(newOperand: 5.0)

operatorSet.append(.Divide)

UpdateOperandSet(newOperand: 8.0)

//operatorSet.append(.Divide)
//
//UpdateOperandSet(newOperand: 2.0)
//
//operatorSet.append(.Subtraction)
//
//UpdateOperandSet(newOperand: 6.0)



//press Equals
PressEqualsButton()

//user presses = button - triggers calculation loop
//Equals button also adds a 0.0 at the end of operand list to keep counts in check
operatorSet.append(.Equals)
UpdateOperandSet(newOperand: 0.0)



//double check current list ordering
print("Operand Set Contents--------")
for (index, val) in operandSet.enumerated() {
    print("Index: \(index): Value: \(val)")
}
print("-----------------------------")

for op in operatorSet {
    print(op)
}

let numOperations = operatorSet.count
let numOperands = operandSet.count

//go through each number in operand set
//assume there are at least 2 operands



//operands:  1.0, 5.0, 2.0, 0.0
//operators: Add, Add, Sub, Equals
var result:Float = 0.0

for index in 0..<numOperations {

    //numOperations will ALWAYS be one less than numOperands due to adding 0 at the end
    //this ensures function never throws an index out of bounds range
    //if first iteration:
    if index == 0 {
        result = InterpretAndPerformOperation(operatorEnum: operatorSet[index], currVal: operandSet[index], rVal:  operandSet[index+1])
        print("leftVal: \(operandSet[index]), rightVal: \(operandSet[index+1]), operation: \(operatorSet[index]) = \(result)")
    }
    //otherwise pass in the result of the previous operation as the current value
    else {
        result = InterpretAndPerformOperation(operatorEnum: operatorSet[index], currVal: result, rVal: operandSet[index+1])
        print("leftVal: \(result), rightVal: \(operandSet[index+1]), operation: \(operatorSet[index]) = \(result)")
    }
}

print("final answer: \(result)")


//output should = 4.0 (1+5 = 6, 6-2 = 4)
let expectedResultOne:Float = 4.0


//reset containers for next test



