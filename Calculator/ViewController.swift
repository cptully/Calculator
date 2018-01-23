//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Tully on 1/20/18.
//  Copyright © 2018 Chris Tully. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var operand1 : Float64 = 0.0
    var operand2 : Float64 = 0.0
    var sOperand1 : String = ""
    var sOperand2 : String = ""
    var operation : String = ""
    var answer : Float64 = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayAnswer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag < 10 {
            if operation == "" {
                sOperand1 += String(sender.tag)
                resultLabel.text = sOperand1
            }
            else {
                sOperand2 += String(sender.tag)
                resultLabel.text = sOperand2
            }
        }
        else if sender.tag == 10 {
            if operation == "" {
                sOperand1 += "."
                resultLabel.text = sOperand1
            }
            else {
                sOperand2 += "."
                resultLabel.text = sOperand2
            }
        }
        else if sender.tag == 11 {
            doArithmatic()
            displayAnswer()
        }
        else if sender.tag == 12 {
            operation = "-"
            sOperand2 = ""
        }
        else if sender.tag == 13 {
            operation = "+"
            sOperand2 = ""
        }
        else if sender.tag == 14 {
            operation = "*"
            sOperand2 = ""
        }
        else if sender.tag == 15 {
            operation = "/"
            sOperand2 = ""
        }
        else if sender.tag == 16 {
            operation = "%"
            sOperand2 = ""
        }
        else if sender.tag == 17 {
            if operation == "" {
                operand1 = Float64(sOperand1)!
                sOperand1 = String(operand1 * -1)
            }
            else {
                operand2 = Float64(sOperand2)!
                sOperand2 = String(operand2 * -1)
            }
        }
        else if sender.tag == 18 {
            operand1 = 0.0
            operand2 = 0.0
            sOperand1 = ""
            sOperand2 = ""
            operation = ""
            answer = 0.0
            displayAnswer()
        }
    }
    
    func doArithmatic() {
        operand1 = Float64(sOperand1)!
        operand2 = Float64(sOperand2)!
        if operation == "+" {
            answer = operand1 + operand2
        }
        else if operation == "-" {
            answer = operand1 - operand2
        }
        else if operation == "*" {
            answer = operand1 * operand2
        }
        else if operation == "/" {
            answer = operand1 / operand2
        }
    }
    
    func displayAnswer() {
        var decimalCount : Int = 11
        
        if answer < 0 {
            decimalCount -= 1
        }
        
        decimalCount -= String(floor(answer)).count

        let frmtStr : String = "%.\(decimalCount)f"

        let sAnswer = String(format: frmtStr, answer)
//        print(sAnswer)
        resultLabel.text = sAnswer
    }
}

