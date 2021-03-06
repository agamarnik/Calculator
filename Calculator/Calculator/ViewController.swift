//
//  ViewController.swift
//  Calculator
//
//  Created by Alice Gamarnik on 2/26/19.
//  Copyright © 2019 Alice Gamarnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnNumberClicked(_ sender: UIButton) {
        //resultLabel.text = sender.currentTitle
        if canClear {
            resultLabel.text = ""
            canClear = false
        }
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "*", "/", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLabel.text = "\(currentText) \(op) "
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                resultLabel.text = "\(result)"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        resultLabel.text = ""
        canClear = false
    }
    
    @IBAction func percent(_ sender: UIButton) {
        var number1 = Double(resultLabel.text!)
        number1 = number1!/100.0
        resultLabel.text = String(number1!)
    }
    
    @IBAction func negative(_ sender: UIButton) {
        var num = Double(resultLabel.text!)
        num = -num!
        resultLabel.text = String(num!)
    }
    
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
    
    


}

