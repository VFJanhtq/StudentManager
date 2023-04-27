//
//  ClassUseCases.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import RealmSwift
import Combine
import SwiftUI

protocol ClassUseCases {
    func addClass(schoolID: String, name: String) -> AnyPublisher<Void, Error>
    func updateClass(classID: String, name: String) -> AnyPublisher<Void, Error>
    func deleteClass(classID: String) -> AnyPublisher<Void, Error>
    func fetchClasses(schoolID: String) -> AnyPublisher<[Class], Error>
}

class ClassRepository: ClassUseCases {
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func addClass(schoolID: String, name: String) -> AnyPublisher<Void, Error> {
        let newClass = Class()
        newClass.id = UUID().uuidString
        newClass.name = name
        
        guard let school = realm.object(ofType: School.self, forPrimaryKey: schoolID) else {
            return Fail(error: NSError(domain: "School not found error 404.", code: 404)).eraseToAnyPublisher()
        }
        
        do {
            try realm.write {
                school.classes.append(newClass)
            }
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    func updateClass(classID: String, name: String) -> AnyPublisher<Void, Error> {
        guard let classObj = realm.object(ofType: Class.self, forPrimaryKey: classID) else {
            return Fail(error: NSError(domain: "Class not found error 404.", code: 404)).eraseToAnyPublisher()
        }
        do {
            try realm.write {
                classObj.name = name
            }
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    func deleteClass(classID: String) -> AnyPublisher<Void, Error> {
        guard let classObj = realm.object(ofType: Class.self, forPrimaryKey: classID) else {
            return Fail(error: NSError(domain: "Class not found error 404.", code: 404)).eraseToAnyPublisher()
        }
        do {
            try realm.write {
                realm.delete(classObj)
            }
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    
    func fetchClasses(schoolID: String) -> AnyPublisher<[Class], Error> {
        guard let school = realm.object(ofType: School.self, forPrimaryKey: schoolID) else {
            let error = NSError(domain: "School not found", code: 404, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let classes = school.classes
        return classes.collectionPublisher
            .map { Array($0) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
