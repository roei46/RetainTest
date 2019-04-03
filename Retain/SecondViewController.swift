//
//  SecondViewController.swift
//  Retain
//
//  Created by roei baruch on 02/04/2019.
//  Copyright © 2019 roei baruch. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var iconClick = true

    var network: NetworkProtocols?

    let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()

        network?.call(success: {
            print("success")
        }, failure: { (error) in
            print(error)
        })
        
    }

    @IBAction func refresh(_ sender: Any) {
        
        if iconClick {
            (sender as AnyObject).setImage(UIImage(named: "test"), for: .normal)
            alert.textFields?[0].isSecureTextEntry = false
        } else {
            (sender as AnyObject).setImage(UIImage(named: "test2"), for: .normal)
            alert.textFields?[0].isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func alertAction(_ sender: Any) {
        alert.addTextField { (textField) in
            textField.placeholder = "Test"
            textField.isSecureTextEntry = true

            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "test2"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
            textField.rightView = button
            textField.rightViewMode = .always
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}

