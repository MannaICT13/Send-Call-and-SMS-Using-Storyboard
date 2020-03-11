//
//  ViewController.swift
//  Send Call and SMS Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 11/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController{

    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBOutlet weak var messageBodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.resignFirstResponder()
        messageBodyTextView.resignFirstResponder()
       
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
    
}
extension ViewController : MFMessageComposeViewControllerDelegate{
 
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
}
