//
//  LoginInteractor.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation
import Combine

protocol CatsTableInteractorProtocol: class {
    func downloadJSON()
}

class CatsTableInteractor: CatsTableInteractorProtocol {

    weak var presenter: CatsTablePresenterProtocol!
    
    required init(presenter: CatsTablePresenterProtocol) {
        self.presenter = presenter
    }
    
    func downloadJSON() {
        let login = UserDefaults.standard.string(forKey: "login")
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=50&page=100&order=DESC")!

        var request = URLRequest(url: url)
        request.addValue(login!, forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                print(posts.map { $0.url })
                self.presenter.cats = posts
                self.presenter.reloadTable()
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
