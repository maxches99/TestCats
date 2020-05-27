//
//  CatsTableViewController.swift
//  TestCats
//
//  Created by Максим Чесников on 26.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import UIKit
import Kingfisher

protocol CatsTableViewProtocol: class {
    func reloadData()
}

class CatsTableViewController: UITableViewController, CatsTableViewProtocol {
    
    var presenter: CatsTablePresenterProtocol!
    let configurator: CatsTableConfiguratorProtocol = CatsTableConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurator.configure(with: self)
        self.presenter.congigureView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.presenter.cats.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath) as? CatTableViewCell
//        cell?.catImageView.image = UIImage(data: nil)
        cell?.catNameLabel.text = presenter.cats[indexPath.row].id
        cell?.catImageView.kf.indicatorType = .activity
        let url = URL(string: presenter.cats[indexPath.row].url)
        cell?.catImageView.kf.setImage(with: url)
        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.openDetail(row: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.presenter.pagination(index: indexPath.row)
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }

}
