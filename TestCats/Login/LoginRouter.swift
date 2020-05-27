//
//  LoginRouter.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

protocol LoginRouterProtocol {
    func closeCurrentViewController()
}

class LoginRouter: LoginRouterProtocol {
    weak var viewController: LoginViewController!
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }

    func closeCurrentViewController() {
        //viewController.dismiss(animated: true, completion: nil)
        //viewController.performSegue(withIdentifier: "firstStep", sender: self)
        let next = self.viewController.storyboard?.instantiateViewController(withIdentifier: "catsTableViewController") as! CatsTableViewController
        next.modalPresentationStyle = .fullScreen
        self.viewController.present(next, animated: true, completion: nil)
        
    }
    
    
}
