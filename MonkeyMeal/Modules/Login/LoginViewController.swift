//
//  LoginViewController.swift
//  MonkeyMeal
//
//  Created by Mochamad Dandi on 24/06/22.
//

import UIKit
import FDUI

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: FDTextField!
    @IBOutlet weak var loginButton: FDPrimaryButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var fbButton: FDPrimaryButton!
    @IBOutlet weak var googleButton: FDPrimaryButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
    }
    @IBAction func forgotButtonTapped(_ sender: Any) {
    }
    @IBAction func fbButtonTapped(_ sender: Any) {
    }
    @IBAction func googleButtonTapped(_ sender: Any) {
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        showSignUpViewController()
        removeFromParent()
    }
    
}
// MARK: - UIViewController
extension UIViewController {
    func showLoginViewController() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
