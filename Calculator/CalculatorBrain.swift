//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 张经纬 on 2018/6/27.
//  Copyright © 2018 Jingwei Zhang. All rights reserved.
//

import Foundation
struct CalculatorBrain{
    
    private var accumulator: Double?;
    var calcMode: String? = "";
    var calcTemp1 = 0.0;
    var calcTemp2 = 0.0;
    
    private enum Operation{
        case constant(Double)
        case unaryOperation
    }
    
//    private var operations: Dictionary<String, Double> =
//    [
//        "π": Operation.constant(Double.pi),  "e": Operation.constant(M_E), "√": Operation.unaryOperation,
//
//    ]
//
    
    mutating func performOperation(_ symbol: String){
//        if let constant = operations[symbol]{
//            accumulator = constant;
//        }
        switch symbol{
        case "π":
            accumulator = Double.pi;
            
        case "√":
            accumulator = sqrt(accumulator!);
            
        case "+":
            calcTemp1 = accumulator!;
            
            calcMode = "add";
            
        case "-":
            calcTemp1 = accumulator!;
            
            calcMode = "subtract";
            
        case "*":
            
            calcTemp1 = accumulator!;
           
            calcMode = "multiply";
            
        case "/":
            calcTemp1 = accumulator!;
            
            calcMode = "division";
            
        case "^":
            calcTemp1 = accumulator!;
            
            calcMode = "power";
            
            
        case "=":
            handle_result(mode: calcMode);
            
        case "C":
            accumulator = 0;
            calcTemp1 = 0;
            calcTemp2 = 0;
            calcMode = "";
            
            
            
        default:
            break;
        }
    }
    
    // The part to handle the calculation result
    mutating func handle_result(mode:String?) {
        switch mode{
        case "add":
            accumulator = accumulator! + calcTemp1;
            
            calcTemp1 = 0;
            
        case "subtract":
            accumulator = accumulator! - calcTemp1;
            
            calcTemp1 = 0;
            
        case "multiply":
            accumulator = accumulator! * calcTemp1;
            
            calcTemp1 = 0;
            
        case "division":
            accumulator = accumulator! / calcTemp1;
            
            calcTemp1 = 0;
            
        case "power":
            calcTemp2 = accumulator!;
            accumulator = pow(calcTemp1,calcTemp2);
            
            calcTemp2 = 0;
            calcTemp1 = 0;
            
        default:
            break;
        }
    }
    
    
    
    
    
    
    mutating func setOperand(_ operand:Double){
        accumulator = operand;
    }
    
    var result:Double?{
        get{
            return accumulator!;
        }
    }
    
}
