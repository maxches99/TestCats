//
//  LoginRouter.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

protocol DetailCatRouterProtocol {
    func closeCurrentViewController()
}

class DetailCatRouter: DetailCatRouterProtocol {
    weak var viewController: DetailCatViewController!
    
    init(viewController: DetailCatViewController) {
        self.viewController = viewController
    }

    func closeCurrentViewController() {

    }
    
    
}
