//
//  ViewController.swift
//  HomeworkL6App
//
//  Created by Hristo Papanov on 15.01.23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case usernameTextField:
            self.emailTextField.becomeFirstResponder()
        case emailTextField:
            self.passwordTextField.becomeFirstResponder()
        case passwordTextField:
            self.passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }

    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let usernameText = self.usernameTextField.text,
              let emailText = self.emailTextField.text,
              let passwordText = self.passwordTextField.text else{
            return
        }
        guard usernameText.count>=3 && usernameText.count<=50
        else{
            self.usernameTextField.backgroundColor = .red.withAlphaComponent(0.3)
            return
        }
        guard emailText.count>=6 && emailText.count<=50 && emailText.containsWhiteSpaces==false
        else{
            self.emailTextField.backgroundColor = .red.withAlphaComponent(0.3)
            return
        }
        guard passwordText.count>=8 && passwordText.count<=32 && passwordText.containsWhiteSpaces == false
        else{
            self.passwordTextField.backgroundColor = .red.withAlphaComponent(0.3)
            return
        }
    }
}

extension String{
    var containsWhiteSpaces: Bool{
        return CharacterSet.whitespaces.isDisjoint(with: CharacterSet(charactersIn: self))==false
    }
}

/*extension ViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
}*/



