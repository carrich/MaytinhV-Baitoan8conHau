//
//  ViewController.swift
//  maytinh
//
//  Created by Ngoduc on 2/20/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    enum mathOperation {
        case divide
        case multiply
        case minus
        case add
        case none
    }
    var i: Int = 0
    var currentMathOperation: mathOperation = .none
    var number1: Int = 0
    var number2: Int = 0
    var number1S: String = ""
    var number2S: String = ""
    var ketqua: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func inputNumber(_ sender: UIButton) {
        if currentMathOperation == .none && number2 == 0 {
            number1S += String(sender.tag)
            number1 = Int(number1S)!
            result.text = String(number1)
        }else if currentMathOperation != .none && ketqua == 0{
            
            number2S += String(sender.tag)
            number2 = Int(number2S)!
            result.text = String(number2)
        } else if currentMathOperation != .none && ketqua != 0{
            number2S = String(sender.tag)
            number2 = Int(number2S)!
            result.text = String(number2)
        }
        
    }
    
    @IBAction func tinhtoan(_ sender: UIButton) {
        i = sender.tag
        switch i {
        case 11:
            currentMathOperation = .add
        case 12:
            currentMathOperation = .minus
        case 13:
            currentMathOperation = .multiply
        case 11:
            currentMathOperation = .divide
        default:
            currentMathOperation = .none
        }
        switch currentMathOperation {
        case .add:
            number1 += number2
            ketqua = number1
            result.text = String(ketqua)
           
        case .minus:
            number1 -= number2
            ketqua = number1
            result.text = String(ketqua)
           
            
        case .multiply:
            number1 *= number2
            ketqua = number1
            result.text = String(ketqua)
            
        case .divide:
            number1 /= number2
            ketqua = number1
            result.text = String(ketqua)
            
        default:
            print("no")
        }
    }
    
    @IBAction func final(_ sender: Any) {
        switch currentMathOperation {
        case .add:
            number1 += number2
            ketqua = number1
            result.text = String(ketqua)
           
        case .minus:
            number1 -= number2
            ketqua = number1
            result.text = String(ketqua)
           
            
        case .multiply:
            number1 *= number2
            ketqua = number1
            result.text = String(ketqua)
            
        case .divide:
            number1 /= number2
            ketqua = number1
            result.text = String(ketqua)
            
        default:
            print("no")
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        number1 = 0
        number2 = 0
        currentMathOperation = .none
        number1S = ""
        result.text = String(number1)
    }
}

