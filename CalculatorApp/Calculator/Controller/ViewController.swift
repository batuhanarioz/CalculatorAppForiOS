import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convertb display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
//        guard let number = Double(displayLabel.text!) else {
//            fatalError("Cannot convertb display label text to a Double")
//        }
        
        if let calcMethod = sender.currentTitle {
            
            let calculator = CalculatorLogic(number: displayValue)
            
            guard let result = calculator.calculate(symbol: calcMethod)
            else {
                fatalError("The result of the calculation is nil.")
            }
            displayValue = result
            
//            if calcMethod == "+/-" {
//                displayValue = displayValue * -1
////                displayLabel.text = String(displayValue * -1)
//            } else if calcMethod == "AC" {
//                displayLabel.text = "0"
//            } else if calcMethod == "%" {
//                displayValue = displayValue * 0.01
////                displayLabel.text = String(displayValue * 0.01)
//            }
        }
        
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber == true {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
//                guard let currentDisplayValue = Double(displayLabel.text!) else {
//                    fatalError("Cannot convert display label text to a Double!")
//                }
                
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    
    }

}

