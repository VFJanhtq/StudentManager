//
//  Student.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import Foundation
import RealmSwift

class Student: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

