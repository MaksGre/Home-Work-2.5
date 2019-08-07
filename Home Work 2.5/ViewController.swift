//
//  ViewController.swift
//  Home Work 2.5
//
//  Created by Maksim Grebenozhko on 06/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    private let userName = "Steven"
    private let password = "Jobs"

    @IBAction func didLogInButton() {
        if !dataIsCorrect(userName: userNameTextField.text!, password: passwordTextField.text!) {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
    }
    
    @IBAction func didForgotButtons(_ sender: UIButton) {
        if sender == forgotUserNameButton {
            showAlert(title: "Oops!", message: "Your name is \(userName) 😊")
        } else if sender == forgotPasswordButton {
            showAlert(title: "Oops!", message: "Your password is \(password) 😊")
        }
    }
    
    private func dataIsCorrect(userName: String, password: String) -> Bool {
        if userName.lowercased() != self.userName.lowercased() {
            return false
        }
        if password != self.password {
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameTextField.text!
    }
}

extension ViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


