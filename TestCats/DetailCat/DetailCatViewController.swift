//
//  ViewController.swift
//  TestCats
//
//  Created by Максим Чесников on 25.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import UIKit

protocol DetailCatViewProtocol: class {
    func presentImage(data: Data)
    func showAlert(title: String, message: String)
}

class DetailCatViewController: UIViewController, DetailCatViewProtocol {

    var presenter: DetailCatPresenterProtocol!
    let configurator: DetailCatConfiguratorProtocol = DetailCatConfigurator()
    var post: Post!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurator.configure(with: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.congigureView(post: post)
    }
    
    @IBAction func onButtonShareClicked(_ sender: UIButton) {

        if let image = self.detailImageView.image {
            let name = self.post.id!
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [name, image], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
            activityViewController.excludedActivityTypes = [
                UIActivity.ActivityType.postToWeibo,
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.postToTencentWeibo
            ]

            self.present(activityViewController, animated: true, completion: nil)
        } else {
            self.showAlert(title: "Изображение еще не загружено", message: "Подождите еще немного...")
        }


    }
    
    func presentImage(data: Data) {
        DispatchQueue.main.async {
            self.detailImageView.image = UIImage(data: data)
        }
        
    }
    
}

