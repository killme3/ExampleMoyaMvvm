//
//  MyServerAPI.swift
//  ExampleMoya
//
//  Created by izul on 30/04/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import Foundation
import Moya
import Alamofire

/// 1:
enum MyServerAPI {
    
    // MARK: - Cameras
    case contacts
    case cameras
    case settingsFor(cameraId: String)
    
    // MARK: - User
    case createUser(email: String, password: String)
    case createComment(parameter: Parameters)
    
    // MARK: - Upload
    case uploadGif(data: Data, description: String)
}

// 2:
extension MyServerAPI: TargetType {
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    // 3:
    var environmentBaseUrl: String {
        switch NetworkManager.environment {
            case .development: return "http://api.androidhive.info"
            case .production: return "http://api.androidhive.info"
            case .jsonPlaceholder: return "https://jsonplaceholder.typicode.com"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl) else {fatalError("baseUrl could not be configure ")}
        return url
    }
    
    // 4:
    var path: String {
        switch self {
        case .contacts:
            return "/contacts/"
        case .uploadGif:
            return "/upload/"
        case .cameras:
            return "/cameras"
        case .settingsFor(let cameraId):
            return "/cameras/\(cameraId)/settings"
        case .createUser:
            return "/user"
        case .createComment:
            return "/posts"
        }
    }
    
    // 5:
    var method: Moya.Method {
        switch self {
        case .createUser, .uploadGif, .createComment:
            return .post
        case .contacts:
            return .get
        default:
            return .get
        }
    }
    
    // 6:
    var parameters: [String: Any]? {
        switch self {
        case .createUser(let email, let password):
            var parameters = [String: Any]()
            parameters["email"] = email
            parameters["password"] = password
            return parameters
        default:
            return nil
        }
    }
    
    // 7:
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    // 8:
    var sampleData: Data {
        return Data()
    }
    
    // 9:
    var task: Task {
        switch self {
        case .contacts:
            return .requestPlain
        case .cameras:
            return .requestPlain
        case .settingsFor(let cameraId):
            return .requestParameters(parameters: ["cameraId": cameraId], encoding: URLEncoding.queryString)
        case .createUser(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: URLEncoding.queryString)
        case .createComment(let parameter):
            return .requestParameters(parameters: parameter, encoding: JSONEncoding.default)
        case let .uploadGif(data, description):
            let gifData = MultipartFormData(provider: .data(data), name: "file", fileName: "gif.gif", mimeType: "image/gif")
            let descriptionData = MultipartFormData(provider: .data(description.data(using: .utf8)!), name: "description")
            let multipartData = [gifData, descriptionData]
            return .uploadMultipart(multipartData)
        }
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}




