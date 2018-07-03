//
//  Comment.swift
//  ExampleMoya
//
//  Created by izul on 03/05/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import Foundation
import Moya

struct Comment: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: String
}
