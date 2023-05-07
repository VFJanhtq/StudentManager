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
    @objc dynamic var clazzID: String = ""
    
    convenience init(name: String, age: Int, clazzID: String) {
        self.init()
        self.id = UUID().uuidString
        self.name = name
        self.age = age
        self.clazzID = clazzID
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

