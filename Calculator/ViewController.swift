//
//  ViewController.swift
//  Calculator
//
//  Created by 张经纬 on 2018/6/26.
//  Copyright © 2018 Jingwei Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var inMiddleTyping: Bool = false;
    var calcMode: String? = "";
    var calcTemp1 = 0.0;
    var calcTemp2 = 0.0;
    
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!;
        print("\(digit) was touched");
        
        if (inMiddleTyping){
            let textCurrentlyInDispaly = display!.text!;
            display!.text = textCurrentlyInDispaly + digit
        }
            
        else {
            display?.text = digit;
            inMiddleTyping = true;
        }
    }
    
    var displayValue: Double{
        get{
            return Double(display.text!)!;
        }
        
        set{
            
            if (newValue != Double(Int(newValue))){
            display.text = String(newValue)
            }
            else {display.text = String(Int(newValue))}
        }
    }
    
    private var brain = CalculatorBrain();
    
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if (inMiddleTyping){
            brain.setOperand(displayValue);
            inMiddleTyping = false;
        }
        
        // The part to handle operation symbols
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol);
        }
        if let result = brain.result{
            displayValue = result;}
        
    }
    
    
 
    
    
    func add(add1:Double, add2:Double) -> Double {
        return 0;
    }
    
    
}

