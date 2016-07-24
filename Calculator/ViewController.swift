//
//  ViewController.swift
//  Calculator
//
//  Created by Guti on 7/23/16.
//  Copyright © 2016 PielDeJaguar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private weak var displayLabel: UILabel!
    // computed property
    private var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    // talking to the model
    private var brain = CalculatorBrain()
    
    private var userIsInTheMiddleOfTyping = false
    private var isFloat = false
    
    // MARK: Actions
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            if digit != "." || displayLabel.text!.rangeOfString(".") == nil {
                let textCurrentlyInDisplay = displayLabel.text!
                displayLabel.text = textCurrentlyInDisplay + digit
            }
        } else {
            displayLabel.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
}

