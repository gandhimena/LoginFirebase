//
//  ViewController+LoginFireBase.swift
//  loginFirebase
//
//  Created by Gandhi Mena Salas on 01/03/17.
//  Copyright © 2017 Gandhi Mena Salas. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func displayErrorAlert(title: String, message: String){
        displayOKAlert(title: title, message: message)
    }
    
    func displayOKAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    func displayOkAlertWithAction(title:String, message:String, completion: @escaping (UIAlertAction)-> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
        alert.addAction(OKAction)
    }
    
    
}
