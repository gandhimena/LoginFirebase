//
//  ViewController.swift
//  loginFirebase
//
//  Created by Gandhi Mena Salas on 01/03/17.
//  Copyright © 2017 Gandhi Mena Salas. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let user = FIRAuth.auth()?.currentUser{
            self.usernameLabel.text = user.email!
            
        }else{
            self.logoutButton.isHidden = true
            self.usernameLabel.text = ""
        }
    }

    @IBAction func createAccount(_ sender: UIButton) {
      
        if self.emailField.text! == ""{
            displayErrorAlert(title: "Ooops", message: "Verifica que tu email sea correcto")
        }else if self.passwordField.text! == "" {
            displayErrorAlert(title: "Ooops", message: "please enter a valid password")
        }else{
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
                if error == nil{
                    self.logoutButton.isHidden = false
                    self.loginButton.isHidden = true
                    self.usernameLabel.text = user?.email!
                }
            })
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        if self.emailField.text! == ""{
            displayErrorAlert(title: "Ooops", message: "Tienes que agregar un email")
        }else if self.passwordField.text! == ""{
            displayErrorAlert(title: "Ooops", message: "tienes que agregar una contraseña")
        }else{
            FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in

                if error == nil{
                    self.logoutButton.isHidden = false
                    self.usernameLabel.text = user?.email!
                }
            })
        }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        self.usernameLabel.text = ""
        self.logoutButton.isHidden = true
        self.loginButton.isHidden = false
        self.emailField.text = ""
        self.passwordField.text = ""
    }
    


}

