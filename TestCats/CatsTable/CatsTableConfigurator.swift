//
//  CatsTableConfigurator.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation
    
protocol CatsTableConfiguratorProtocol {
    func configure(with viewController: CatsTableViewController)
}

class CatsTableConfigurator: CatsTableConfiguratorProtocol {
    func configure(with viewController: CatsTableViewController) {
        let presenter = CatsTablePresenter(view: viewController)
        let interactor = CatsTableInteractor(presenter: presenter)
        let router = CatsTableRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
