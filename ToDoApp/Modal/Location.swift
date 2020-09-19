//
//  Location.swift
//  ToDoApp
//
//  Created by Антон Калинин on 19.09.2020.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard rhs.coordinate?.latitude == lhs.coordinate?.latitude
                && rhs.coordinate?.longitude == lhs.coordinate?.longitude else {
            return false
        }
        
        return true
    }
}
