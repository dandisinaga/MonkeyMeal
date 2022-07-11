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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
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
