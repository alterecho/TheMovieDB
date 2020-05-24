//
//  Services.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Moya

enum Services: TargetType {
    
    static func load() {
        MoyaProvider<Services>().request(.configuration) { result in
            switch result {
            case .success(let response):
                do {
                    let response = try JSONDecoder().decode(ConfigResponse.self, from: response.data)
                    imagesBaseURL = URL(string: response.images.secure_base_url)
                } catch {
                    
                }
            case .failure(_):
                break
            }
            
        }
    }
    
    static func errorFrom(response: Response, data: Data) -> Error? {
        let validCodes = [200, 201]
        if !validCodes.contains(response.statusCode) {
            return try? JSONDecoder().decode(ErrorResponse.self, from: data)
        }
        return nil
    }
    
    var completeURL: URL? {
        switch self {
        case .imageURL(let path, let size):
            if let baseURL = Services.imagesBaseURL {
                return URL(string: "\(baseURL)\(size.rawValue)\(path)")
            }

        default:
            break
        }
        
        return nil
    }

    
    private static var imagesBaseURL: URL?
    
    private static let apiKey = "5840b7c78e4327a4deadbd1981cb1d40"
    private static let configURL = URL(string: "https://api.themoviedb.org/3/configuration?api_key=\(apiKey)")!
    private static let baseURL = URL(string: "https://api.themoviedb.org/3")!
    
        

    case configuration
    case genre
    case discover(genreID: Int, page: Int)
    case movieDetails(movieID: Int)
    case videos(movieID: Int)
    case imageURL(path: String, size: ImageSize = ImageSize.original)
    case userReviews(movieID: Int)
    
    var baseURL: URL {
        switch self {
        case .imageURL:
            return Services.imagesBaseURL ?? Services.baseURL
        default:
            return Services.baseURL
        }
    }
    
    var path: String {
        switch self {
            
        case .configuration:
            return "/configuration"
        case .genre:
            return "/genre/movie/list"
        case .discover:
            return "/discover/movie"
        case .movieDetails(let movieID):
            return "/movie/\(movieID)"
        case .videos(let movieID):
            return "/movie/\(movieID)/videos"
        case .userReviews(let movieID):
            return "/movie/\(movieID)/reviews"
        case .imageURL(let path, let size):
            return size.rawValue + path
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        var params: [String: Any] = ["api_key": Services.apiKey]
        switch  self {
        case .discover(let genreID, let page):
            params["with_genres"] = genreID
            params["page"] = page
        default:
            break
            
        }
        
        return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}

