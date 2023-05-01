//
//  School.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import Foundation
import RealmSwift

class School: Object,Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    
    convenience init(value: Object) {
        self.init()
        id = value["id"] as! String
        name = value["name"] as! String
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
