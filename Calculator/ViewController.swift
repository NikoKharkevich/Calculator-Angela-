
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    
    //What should happen when a non-number button is pressed
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError()
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
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
                    guard let currentDisplayValue = Double(displayLabel.text!) else {fatalError()}
                    
                    // checking rounded down value to ensure we have only one dot
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    // if we dont have an Integer we return dont continue appending current number value to the display 
                    if !isInt { return }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    
    }

}

