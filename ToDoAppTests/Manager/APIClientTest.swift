//
//  APIClientTest.swift
//  ToDoAppTests
//
//  Created by Антон Калинин on 28.09.2020.
//

import XCTest
@testable import ToDoApp

class APIClientTest: XCTestCase {
    
    var sut: APIClient!
    var mockURLSession: MockURLSession!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockURLSession = MockURLSession()
        sut = APIClient()
        sut.urlSession = mockURLSession
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func userLogin() {
        let completionHandler = {(token: String?, error: Error?) in }
        sut.login(withName: "name", password: "%qwerty", completionHandler: completionHandler)
    }

    func testLoginUsesCorrectHost() {
        userLogin()
        XCTAssertEqual(mockURLSession.urlComponents?.host, "todoapp.com")
    }
    
    func testLoginUserCorrectPath() {
        userLogin()
        XCTAssertEqual(mockURLSession.urlComponents?.path, "/login")
    }
    
    func testLoginUsesExpectedQueryName() {
        userLogin()
        
        guard let queryItems =  mockURLSession.urlComponents?.queryItems else {
            XCTFail()
            return
        }
        
        let urlQueryItemName = URLQueryItem(name: "name", value: "name")
        
        XCTAssertTrue(queryItems.contains(urlQueryItemName))
    }
    
    func testLoginUsesExpectedQueryPassword() {
        userLogin()
        
        guard let queryItems =  mockURLSession.urlComponents?.queryItems else {
            XCTFail()
            return
        }
    
        let urlQueryItemPassword = URLQueryItem(name: "password", value: "%qwerty")
        
        XCTAssertTrue(queryItems.contains(urlQueryItemPassword))
    }
    
}

extension APIClientTest {
    
    class MockURLSession: URLSessionProtocol {
        
        var url: URL?
        
        var urlComponents: URLComponents? {
            guard let url = url else {
                return nil
            }
            
            return URLComponents(url: url, resolvingAgainstBaseURL: true)
        }
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            
            return URLSession.shared.dataTask(with: url)
        }
        
    }
    
}
