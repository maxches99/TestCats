//
//  LoginPresenter.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

protocol CatsTablePresenterProtocol: class {
    var router: CatsTableRouterProtocol! { set get }
    func congigureView()
    var cats: [Post]! { set get }
    func reloadTable()
    func openDetail(row: Int)
    func pagination(index: Int)
    var isNewDataLoading: Bool! { get set }
}

class CatsTablePresenter:CatsTablePresenterProtocol {
    
    var isNewDataLoading: Bool!
    weak var view: CatsTableViewProtocol!
    var interactor: CatsTableInteractorProtocol!
    var router: CatsTableRouterProtocol!
    var cats: [Post]! = []
    
    required init(view: CatsTableViewProtocol) {
        self.view = view
    }
    
    func congigureView() {
        self.interactor.downloadJSON()
        
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.view.reloadData()
        }
    }
    
    func openDetail(row: Int) {
        self.router.openDetailsOfCat(post: cats[row])
    }
    
    func pagination(index: Int) {
        if index >= self.cats.count - 50, !self.isNewDataLoading {
            self.interactor.downloadJSON()
        }
    }
}
