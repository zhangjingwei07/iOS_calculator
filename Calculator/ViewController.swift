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
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        inMiddleTyping = false;

        
        // The part to handle operation symbols
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol{
            case "π":
                displayValue = Double.pi;
                
            case "√":
                displayValue = sqrt(displayValue);
                
            case "+":
                calcTemp1 = displayValue;
                inMiddleTyping = false;
                calcMode = "add";
                
            case "-":
                calcTemp1 = displayValue;
                inMiddleTyping = false;
                calcMode = "subtract";
                
            case "*":
                calcTemp1 = displayValue;
                inMiddleTyping = false;
                calcMode = "multiply";
            
            case "/":
                calcTemp1 = displayValue;
                inMiddleTyping = false;
                calcMode = "division";
                
            case "^":
                calcTemp1 = displayValue;
                inMiddleTyping = false;
                calcMode = "power";
                
                
            case "=":
                handle_result(mode: calcMode);
                
            case "C":
                displayValue = 0;
                calcTemp1 = 0;
                calcTemp2 = 0;
                calcMode = "";
                
                
            default:
                break;
            }
        
        }
    }
    
    // The part to handle the calculation result
    func handle_result(mode:String?) {
        switch mode{
        case "add":
            displayValue = displayValue + calcTemp1;
            inMiddleTyping = false;
            calcTemp1 = 0;
            
        case "subtract":
            displayValue = displayValue - calcTemp1;
            inMiddleTyping = false;
            calcTemp1 = 0;
            
        case "multiply":
            displayValue = displayValue * calcTemp1;
            inMiddleTyping = false;
            calcTemp1 = 0;
            
        case "division":
            displayValue = displayValue / calcTemp1;
            inMiddleTyping = false;
            calcTemp1 = 0;
            
        case "power":
            calcTemp2 = displayValue;
            displayValue = pow(calcTemp1,calcTemp2);
            inMiddleTyping = false;
            calcTemp2 = 0;
            calcTemp1 = 0;
            
        default:
            break;
        }
    }
    
    
    func add(add1:Double, add2:Double) -> Double {
        return 0;
    }
    
    
}

