//
//  StudentUseCases.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import RealmSwift
import Combine
import SwiftUI


protocol StudentUseCases {
    func fetchStudents(classID: String) -> AnyPublisher<[Student], Error>
    func addStudent(classID: String, name: String, age: Int) -> AnyPublisher<Void, Error>
    func updateStudent(id: String, name: String, age: Int) -> AnyPublisher<Void, Error>
    func deleteStudent(id: String) -> AnyPublisher<Void, Error>
}

class StudentRepository: StudentUseCases {
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func fetchStudents(classID: String) -> AnyPublisher<[Student], Error> {
        guard let cls = realm.object(ofType: Clazz.self, forPrimaryKey: classID) else {
            let error = NSError(domain: "Class not found", code: 404, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let students = cls.students
        return students.collectionPublisher
            .map { Array($0) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }

    func addStudent(classID: String, name: String, age: Int) -> AnyPublisher<Void, Error> {
        guard let cls = realm.object(ofType: Clazz.self, forPrimaryKey: classID) else {
            let error = NSError(domain: "Class not found", code: 404, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let student = Student()
        student.name = name
        student.age = age
        
        do {
            try realm.write {
                cls.students.append(student)
            }
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

    func updateStudent(id: String, name: String, age: Int) -> AnyPublisher<Void, Error> {
        guard let student = realm.object(ofType: Student.self, forPrimaryKey: id) else {
            let error = NSError(domain: "Student not found", code: 404, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        do {
            try realm.write {
                student.name = name
                student.age = age
            }
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

    func deleteStudent(id: String) -> AnyPublisher<Void, Error> {
        guard let student = realm.object(ofType: Student.self, forPrimaryKey: id) else {
            let error = NSError(domain: "Student not found", code: 404, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        do {
            try realm.write {
                realm.delete(student)
            }
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

}

