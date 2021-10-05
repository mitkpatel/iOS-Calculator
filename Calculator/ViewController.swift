//
//  ViewController.swift
//  Calculator
//
//  Created by user202387 on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        outputLbl.text = "0"
    }
    
    var expression:String = ""
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation = ""
    
    func push(expr: String) -> String {
        if(expression.isEmpty) {
            self.expression += expr
            return expr
        }else if(!expr.contains("[0-9]+")) {
            self.expression += expr
            return expr
        }else {
            return "Something wrong!!!"
        }
    }
    
    func calc(operation:String)-> String{
        if !currentOperation.isEmpty {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == "Add" {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    push(expr: "+")
                    return result
                } else if currentOperation == "Subtract" {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    push(expr: "-")
                    return result
                } else if currentOperation == "Multipy" {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    push(expr: "*")
                    return result
                } else if currentOperation == "Divide" {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                    push(expr: "/")
                    return result
                } else {
                    return "Wrong input"
                }
            }
            currentOperation = operation
            outputLbl.text = result
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
           
            return result
        }
        return "wrong"
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 8 {
            runningNumber += push(expr: "\(sender.tag)")
            outputLbl.text = runningNumber
        }
    }
    
    @IBAction func allClearePressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = ""
        outputLbl.text = "0"
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        calc(operation: "Add")
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        calc(operation: "Subtract")
    }
    
    @IBAction func multipyPressed(_ sender: UIButton) {
        calc(operation: "Multipy")
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        calc(operation: "Divide")
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        outputLbl.text = calc(operation: "currentOperation")
    }
}

