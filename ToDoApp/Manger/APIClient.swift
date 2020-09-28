//
//  APIClient.swift
//  ToDoApp
//
//  Created by Антон Калинин on 28.09.2020.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class APIClient {
    
    lazy var urlSession: URLSessionProtocol = URLSession.shared
    
    func login(withName name: String, password: String, completionHandler: @escaping (String?, Error?) -> Void) {
        guard let url = URL(string: "https://todoapp.com/login") else {
            fatalError()
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            
        }.resume()
    }
}
