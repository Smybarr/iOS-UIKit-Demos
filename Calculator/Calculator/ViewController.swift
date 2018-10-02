//
//  ViewController.swift
//  Calculator
//
//  Created by Steven Ybarra on 7/5/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum OperatorType {
        case Addition
        case Subtraction
        case Multiply
        case Divide
        case Equals
    }
    
    enum NumberButton {
        case Zero
        case One
        case Two
        case Three
        case Four
        case Five
        case Six
        case Seven
        case Eight
        case Nine
        
    }
    
    var operandSet:[Float] = [];
    var operatorSet:[OperatorType] = [];
    
    var resetLabelFlag = false;
    var prevResultVal:Float = 0.0;
    var hasPrevResult = false;
    
    func IsFirstDigit() -> Bool {
        //if only text on output label is 0 or an operator sign,
        if (self.outputLabel.text == "0" ||
            self.outputLabel.text == "+" ||
            self.outputLabel.text == "-" ||
            self.outputLabel.text == "/" ||
            self.outputLabel.text?.lowercased() == "x")
        {
            return true
        }
        else  {
            return false
        }
    }
    
    func ResetData() {
        self.outputLabel.text = "0";
        self.prevResultVal = 0.0
        self.hasPrevResult = false
        self.operandSet.removeAll()
        self.operatorSet.removeAll()
    }
    
    
    
    //clear button resets everything
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        self.ResetData()
    }
    
    //register that the user pressed a button;
    //currently only works with the one button
    @IBAction func OneButtonPressed(_ sender: UIButton) {
        
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            print("Reset the data - new operation")
            outputLabel.text = "1";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "1";
        }
        else {
            print("OneButtonPressed - append '1' to end of outputLabel")
            outputLabel.text?.append("1");
        }
    }
    
    //second button for the '2' button -
    @IBAction func TwoButtonPressed(_ sender: UIButton) {
        
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "2";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "2";
        }
        else {
            print("TwoButtonPressed - append '2' to end of outputLabel")
            outputLabel.text?.append("2");
        }
    }
    //3 button
    @IBAction func ThreeButtonPressed(_ sender: Any) {
        
         if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "3";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "3";
        }
        else {
            print("ThreeButtonPressed - append '3' to end of outputLabel")
            outputLabel.text?.append("3");
        }
    }
    
    @IBAction func FourButtonPressed(_ sender: Any) {
        
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "4";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "4";
        }
        else {
            print("FourButtonPressed - append '4' to end of outputLabel")
            outputLabel.text?.append("4");
        }
    }
    
    @IBAction func FiveButtonPressed(_ sender: Any) {
        
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "5";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "5";
        }
        else {
            print("FiveButtonPressed - append '5' to end of outputLabel")
            outputLabel.text?.append("5");
        }
    }
    @IBAction func SixButtonPressed(_ sender: Any) {
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "6";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "6";
        }
        else {
            print("SixButtonPressed - append '6' to end of outputLabel")
            outputLabel.text?.append("6");
        }
    }
    @IBAction func SevenButtonPressed(_ sender: Any) {
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "7";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "7";
        }
        else {
            print("SevenButtonPressed - append '7' to end of outputLabel")
            outputLabel.text?.append("7");
        }
    }
    @IBAction func EightButtonPressed(_ sender: Any) {
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "8";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "8";
        }
        else {
            print("EightButtonPressed - append '8' to end of outputLabel")
            outputLabel.text?.append("8");
        }
    }
    @IBAction func NineButtonPressed(_ sender: Any) {
        if (IsFirstDigit() || hasPrevResult)
        {
            self.ResetData()
            outputLabel.text = "9";
        }
        else if (IsFirstDigit() && !hasPrevResult) {
            //don't reset if you don't have a result yet
            print("First Digit of new operand - don't reset, just replace the output label")
            outputLabel.text = "9";
        }
        else {
            print("NineButtonPressed - append '9' to end of outputLabel")
            outputLabel.text?.append("9");
        }
    }
    
    //---------------------------------------
    //operator button actions
    
    //perform a math operation based on the specified OperatorType
    //input variables should be stored in OperandSet and OperatorSet
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
    
    //take all operands and operators (starting at the front of each list)
    //and perform the appropriate calculation:
    @IBAction func EqualsButtonPressed(_ sender: Any) {
        
        //Get the last operand entered
        //--------------------------------
        
        //take the output label value and convert to a usable floatValue
        let numberFormatter = NumberFormatter()
        let prevOperandValue = numberFormatter.number(from: self.outputLabel.text!)
        let prevOperandFloat = prevOperandValue?.floatValue
        
        //store the value in a container for later use
        self.operandSet.append(prevOperandFloat!)
        //print current calculation set
        print("Added \(prevOperandFloat) to Operand Set")
        
        //--------------------------------
        //Add the Equals and a 0 at the end of operandSet as a sort of null terminator
        
        //add equals to end of operatorSet - .Equals will force calculations to stop
        self.operatorSet.append(.Equals)
        print("Added \(OperatorType.Equals) to Operator Set")
        //add a 0 at the end to ensure accurate loop counts
        self.operandSet.append(0.0)
        print("Added 0.0 to Operand Set")
        
        //--------------------------------
        //Debug Print
        print("Operator Set:")
        print(self.operatorSet)
        print("Operand Set:")
        print(self.operandSet)
        
        //Iterate data and perform operations
        //--------------------------------
    
        //numOperations should always be one less than num Operands
        let numOperations = self.operatorSet.count
        let numOperands = self.operandSet.count
        
        //initialize the result
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
        
        //display the result
        
        //if result is rounded to the nearest whole, display as an int
        
        //otherwise display as a float value
        self.outputLabel.text = String(result)
        
        //set the reset label flag to true
        //if a user presses another number than it will replace the current output label
        self.hasPrevResult = true
        
        //store the last result in case user presses another operator button
        self.prevResultVal = result
    }
    
    
    
    //Add previous operand value to operands set
    //also add an addition operator to operator set
    @IBAction func PlusOperatorButtonPressed(_ sender: Any) {
        print("Plus Button Pressed")
        //only do the following if the plus sign wasn't just pressed;
        //this ensures operand/operator ratios stay the same in the sets
        if (self.outputLabel.text != "+") {
            //take the output label value and convert to a usable floatValue
            let numberFormatter = NumberFormatter()
            let prevOperandValue = numberFormatter.number(from: self.outputLabel.text!)
            let prevOperandFloat = prevOperandValue?.floatValue
            
            //store the value in a container for later use
            self.operandSet.append(prevOperandFloat!)
            //print current calculation set
            print("Added \(prevOperandFloat) to Operand Set")
            
            //add '+' operator to operator set for final calculation
            self.operatorSet.append(OperatorType.Addition)
            print("Added \(OperatorType.Addition) to Operator Set")
            //Display a '+' sign on the outputLabel
            self.outputLabel.text = "+";
        }
    }
    
    
    
    
    
    
    
    
    @IBAction func PosNegButtonPressed(_ sender: Any) {
        
        //check if current outputLabel value is positive or Negative
    }
    
    
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialize outputLabel to display 0;
        self.outputLabel.text = "0";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

