//
//  LoginPresenter.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol: class {
    var router: LoginRouterProtocol! { set get }
    func congigureView()
    func loginButtonClicked(login: String)
    func loadImage()
    func presentImage(data: Data)
}

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!
    
    required init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func congigureView() {
        self.view.configureButton()
        loadImage()
        
    }
    
    func loginButtonClicked(login: String) {
        print("presenter")
        UserDefaults.standard.set(login, forKey: "login")
        self.router.closeCurrentViewController()
    }
    
    func loadImage() {
        self.interactor.downloadImage()
    }
    
    func presentImage(data: Data) {
        self.view.presentImage(data: data)
    }
}
