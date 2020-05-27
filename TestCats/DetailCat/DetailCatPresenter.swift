//
//  LoginPresenter.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

protocol DetailCatPresenterProtocol: class {
    var router: DetailCatRouterProtocol! { set get }
    func congigureView(post: Post)
    func presentImage(data: Data)
    func downloadDetailImage(string: String)
}

class DetailCatPresenter: DetailCatPresenterProtocol {
    
    weak var view: DetailCatViewProtocol!
    var interactor: DetailCatInteractorProtocol!
    var router: DetailCatRouterProtocol!
    
    required init(view: DetailCatViewProtocol) {
        self.view = view
    }
    
    func congigureView(post: Post) {
        downloadDetailImage(string: post.url)
    }
    
    func presentImage(data: Data) {
        self.view.presentImage(data: data)
    }
    
    func downloadDetailImage(string: String) {
        self.interactor.downloadData(string: string)
    }
}
