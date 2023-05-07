//
//  Class.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import Foundation
import RealmSwift

class Clazz: Object,Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var schoolID: String = ""
    
    convenience init(name: String, schoolID: String) {
        self.init()
        self.id = UUID().uuidString
        self.name = name
        self.schoolID = schoolID
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
