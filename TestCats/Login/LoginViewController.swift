//
//  ViewController.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class {
    func presentImage(data: Data)
    func configureButton()
    func showAlert(title: String, message: String)
}

class LoginViewController: UIViewController, LoginViewProtocol {

    var presenter: LoginPresenterProtocol!
    let configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurator.configure(with: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.congigureView()
    }

    @IBAction func onLoginButtonClicked(_ sender: UIButton) {
        if let login = self.loginTextField.text, !login.isEmpty {
            self.presenter.loginButtonClicked(login: login)
        } else {
            self.showAlert(title: "Не введен логин", message: "")
        }
    }
    
    func presentImage(data: Data) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
        }
        
    }
    
    func configureButton() {
        self.loginButton.layer.cornerRadius = 10.0
    }
}

