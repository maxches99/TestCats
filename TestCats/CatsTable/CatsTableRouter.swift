//
//  LoginRouter.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

protocol CatsTableRouterProtocol {
    func openDetailsOfCat(post: Post)
}

class CatsTableRouter: CatsTableRouterProtocol {
    
    weak var viewController: CatsTableViewController!
    
    init(viewController: CatsTableViewController) {
        self.viewController = viewController
    }
    
    func openDetailsOfCat(post: Post) {
        let next = self.viewController.storyboard?.instantiateViewController(withIdentifier: "detailCatViewController") as! DetailCatViewController
        next.post = post
        self.viewController.present(next, animated: true, completion: nil)
    }
    
}
