//
//  ViewController.swift
//  Send Call and SMS Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 11/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController,UITextFieldDelegate{

    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBOutlet weak var messageBodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
            phoneTextField.keyboardType = .numbersAndPunctuation
            phoneTextField.returnKeyType = .done
            phoneTextField.delegate = self
            dismissKeyboardWhenTappedAround()
            
     
    }

    
    @IBAction func callAction(_ sender: Any) {
        
        if let url = NSURL(string: "TEL://\(String(describing: phoneTextField.text))") {
            
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            
        }
        
        
        
        
        
    }
    @IBAction func smsAction(_ sender: Any) {
        
        let messageController = MFMessageComposeViewController()
        messageController.messageComposeDelegate = self
        messageController.body = messageBodyTextView.text!
        messageController.recipients = [phoneTextField.text!]
        
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneTextField.resignFirstResponder()
      
        return true
    }
    
    
}
extension ViewController : MFMessageComposeViewControllerDelegate{
 
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
}

extension  ViewController{
    
    func dismissKeyboardWhenTappedAround(){
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
        
    }
    
    
}
