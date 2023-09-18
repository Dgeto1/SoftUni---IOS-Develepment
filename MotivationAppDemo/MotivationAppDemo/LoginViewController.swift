//
//  LoginViewController.swift
//  MotivationAppDemo
//
//  Created by Hristo Papanov on 16.09.23.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
            validateFields()
        }
    
    func validateFields(){
        if emailTextField.text?.isEmpty == true{
            print("Error!")
            return
        }
        
        if(passwordTextField.text?.isEmpty == true){
            print("Error!")
            return
        }
        
        login()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err{
                print(err.localizedDescription)
            }
        }
        checkUserInfo()
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainHome")
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
        }
    }
}
