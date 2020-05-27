//
//  LoginInteractor.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation
import Combine

protocol DetailCatInteractorProtocol: class {
    func downloadData(string: String)
}

class DetailCatInteractor: DetailCatInteractorProtocol {

    weak var presenter: DetailCatPresenterProtocol!
    
    required init(presenter: DetailCatPresenterProtocol) {
        self.presenter = presenter
    }
    
    func downloadData(string: String) {
        let url = URL(string: string)!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                fatalError("Error: invalid HTTP response code")
            }
            guard let data = data else {
                fatalError("Error: missing response data")
            }

            do {
                self.presenter.presentImage(data: data)
            }
            catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        DispatchQueue.global(qos: .background).async {
            task.resume()
        }
    }
}
