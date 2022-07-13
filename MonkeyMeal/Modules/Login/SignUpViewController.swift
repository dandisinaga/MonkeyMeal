//
//  SignUpViewController.swift
//  MonkeyMeal
//
//  Created by Mochamad Dandi on 12/07/22.
//

import UIKit
import FDUI

class SignUpViewController: UIViewController {
    @IBOutlet weak var nameTextField: FDTextField!
    @IBOutlet weak var emailTextField: FDTextField!
    @IBOutlet weak var phoneTextField: FDTextField!
    @IBOutlet weak var addressTextField: FDTextField!
    @IBOutlet weak var passwordTextField: FDTextField!
    @IBOutlet weak var confirmPasswordTextField: FDTextField!
    @IBOutlet weak var signUpButton: FDPrimaryButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        view.endEditing(true)
        //Sign up operation
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        showLoginViewController()
        removeFromParent()
    }
}

// MARK: - UIViewController
extension UIViewController {
    func showSignUpViewController() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignUp") as! SignUpViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
