//
//  UIViewControllerExtension.swift
//  FDUI
//
//  Created by Mochamad Dandi on 12/07/22.
//

import UIKit

extension UIViewController {
    @IBAction public func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction public func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion:  nil)
    }
}
