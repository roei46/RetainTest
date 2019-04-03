//
//  ViewController.swift
//  Retain
//
//  Created by roei baruch on 28/03/2019.
//  Copyright © 2019 roei baruch. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var network: NetworkProtocols?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        network?.call(success: {
            print("success")
        }, failure: { (error) in
            print(error)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentViewController(vc: "SecondViewController")

    }
    
    func presentViewController(vc: String) {
        let storyboard = self.storyboard
        let controller = storyboard?.instantiateViewController(withIdentifier: vc)
        self.present(controller!, animated: true, completion: nil)
        
//        weak var vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
//        self.present(vc!, animated: true, completion: nil)

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit {
        print("splash is deinit")
    }
}

