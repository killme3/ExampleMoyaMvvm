//
//  Contact.swift
//  ExampleMoya
//
//  Created by izul on 02/05/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import Foundation
import Moya

struct Contact: Codable {
    let id: String
    let email: String
    let gender: String
    let name: String
    let address: String
    let phone: Phone
}
//extension Contact: Decodable {
//    enum contactCodingKeys: String, CodingKey {
//        case id
//        case email
//        case gender
//        case name
//        case address
//        case phone
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: contactCodingKeys.self)
//
//        id = try container.decode(String.self, forKey: .id)
//        email = try container.decode(String.self, forKey: .email)
//        gender = try container.decode(String.self, forKey: .gender)
//        name = try container.decode(String.self, forKey: .name)
//        address = try container.decode(String.self, forKey: .address)
//        phone = try container.decode(Phone.self, forKey: .phone)
//    }
//}

struct Phone: Codable {
    let mobile: String
    let home: String
    let office: String
}

//extension Phone: Decodable {
//    enum phoneCodingKeys: String, CodingKey {
//        case mobile
//        case home
//        case office
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: phoneCodingKeys.self)
//
//        mobile = try container.decode(String.self, forKey: .mobile)
//        home = try container.decode(String.self, forKey: .home)
//        office = try container.decode(String.self, forKey: .office)
//    }
//}

struct ContactResult {
    let contact: [Contact]
}

extension ContactResult: Decodable {
    enum ContactResultCodingKeys: String, CodingKey {
        case contact = "contacts"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContactResultCodingKeys.self)
        
        contact = try container.decode([Contact].self, forKey: .contact)
    }
}



