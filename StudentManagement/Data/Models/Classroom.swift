//
//  Class.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import Foundation
import RealmSwift

class Class: Object,Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    let students = List<Student>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
