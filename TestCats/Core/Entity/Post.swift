//
//  Post.swift
//  TestCats
//
//  Created by Максим Чесников on 26.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

struct Post: Codable {

    let id: String?
    let url: String
    let width: Int
    let height: Int
}
