//
//  Utilities.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/26.
//

import Foundation
import UIKit

final class Utilities {
    
    func formatPhoneNumber(_ number: String) -> String {
        let cleanNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "(XXX) XXX-XXXX"
        var result = ""
        var index = cleanNumber.startIndex
        
        for ch in mask where index < cleanNumber.endIndex {
            if ch == "X" {
                result.append(cleanNumber[index])
                index = cleanNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func formatCardNumber(_ number: String) -> String {
        var formatted = ""
        for (index, character) in number.enumerated() {
            if index > 0 && index % 4 == 0 {
                formatted.append(" ")
            }
            formatted.append(character)
        }
        return formatted
    }
}

//extension UIViewController{
//    func toolBar() -> UIToolbar{
//        let toolBar = UIToolbar()
//        toolBar.barStyle = .default
//        toolBar.isTranslucent = true
//        toolBar.barTintColor = UIColor.init(red: 0/255, green: 25/255, blue: 61/255, alpha: 1) //Write what you want for color
//        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        var buttonTitle = "Done" //Or "Tamam"
//        var cancelButtonTitle = "Cancel" //Or "İptal" for Turkish
//        let doneButton = UIBarButtonItem(title: buttonTitle, style: .prominent, target: self, action: #selector(onClickDoneButton))
//        let cancelButton = UIBarButtonItem(title: cancelButtonTitle, style: .plain, target: self, action: #selector(onClickCancelButton))
//        doneButton.tintColor = .white
//        cancelButton.tintColor = .white
//        toolBar.setItems([cancelButton, space, doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//        toolBar.sizeToFit()
//        return toolBar
//    }
//    
//    @objc func onClickDoneButton(){
//        view.endEditing(true)
//    }
//    
//    @objc func onClickCancelButton(){
//        view.endEditing(true)
//    }
//}
