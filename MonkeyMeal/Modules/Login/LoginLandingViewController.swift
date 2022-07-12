//
//  LoginLandingViewController.swift
//  MonkeyMeal
//
//  Created by Mochamad Dandi on 24/06/22.
//

import UIKit
import FDUI

class LoginLandingViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.primary.cgColor
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        showLoginViewController()
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        showSignUpViewController()
    }
}

// MARK: - UIViewController
extension UIViewController {
    func showLoginLandingViewController() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginLanding")
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as! UIWindowScene
        let window = windowScene.windows.first!
        
        let navigtaionController = FDNavigationController(rootViewController: viewController)
        navigtaionController.isNavigationBarHidden = true
        
        window.rootViewController = navigtaionController
    }
}
