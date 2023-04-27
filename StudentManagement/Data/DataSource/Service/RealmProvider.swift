//
//  RealmProvider.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/24.
//

import Foundation
import RealmSwift

class RealmProvider: ObservableObject {
    static let shared = RealmProvider()
    
    private let realm: Realm
    
    private init() {
        realm = try! Realm()
    }
    
    func getRealm() -> Realm {
        return realm
    }
}

