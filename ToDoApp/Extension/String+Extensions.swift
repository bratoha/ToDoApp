//
//  String+Extensions.swift
//  ToDoApp
//
//  Created by Антон Калинин on 28.09.2020.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "~!@#$%^&*()-+=[]\\}{,./?><").inverted
        
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        
        return encodedString
    }
}
