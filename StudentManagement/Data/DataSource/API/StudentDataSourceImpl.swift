//
//  StudentDataSourceImpl.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/30.
//

import Foundation
import RealmSwift
import Combine

struct StudentDataSourceImpl: StudentDataSource {
    
    enum RepositoryError: Error {
        case studentNotFound
        case invalidInput
    }
    
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func fetchStudent(for clazzID: String) -> Future<[Student], Error> {
        return Future { promise in
            let realm = try! Realm()
            let students = realm.objects(Student.self).filter("clazzID = %@", clazzID)
            promise(.success(Array(students)))
        }
    }
    
    func addStudent(name: String, age: Int, for clazzID: String) -> Future<Void, Error> {
        return Future { promise in
            do {
                try realm.write {
                    let student = Student()
                    student.name = name
                    student.age = age
                    student.clazzID = clazzID
                    realm.add(student)
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func updateStudent(id: String, name: String) -> Future<Void, Error> {
        return Future { promise in
            guard let student = realm.object(ofType: Student.self, forPrimaryKey: id) else {
                promise(.failure(RepositoryError.studentNotFound))
                return
            }
            
            do {
                try realm.write {
                    student.name = name
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func deleteStudent(id clazzID: String) -> Future<Void, Error> {
        return Future { promise in
            guard let student = realm.object(ofType: Clazz.self, forPrimaryKey: clazzID) else {
                promise(.failure(RepositoryError.studentNotFound))
                return
            }
            
            do {
                try realm.write {
                    realm.delete(student)
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
}
