//
//  LoginConfigurator.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation
    
protocol DetailCatConfiguratorProtocol {
    func configure(with viewController: DetailCatViewController)
}

class DetailCatConfigurator: DetailCatConfiguratorProtocol {
    func configure(with viewController: DetailCatViewController) {
        let presenter = DetailCatPresenter(view: viewController)
        let interactor = DetailCatInteractor(presenter: presenter)
        let router = DetailCatRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
