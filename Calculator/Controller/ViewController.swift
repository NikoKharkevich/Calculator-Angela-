
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError() }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
        
    private var calculator = CalculatorLogic()
    
    //What should happen when a non-number button is pressed
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            guard let result = calculator.calculate(symbol: calcMethod) else { fatalError() }
            displayValue = result
        }
        
    }

    //What should happen when a number is entered into the keypad
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    // checking rounded down value to ensure we have only one dot
                    let isInt = floor(displayValue) == displayValue
                    
                    // if we dont have an Integer we return dont continue appending current number value to the display
                    if !isInt { return }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }
}

