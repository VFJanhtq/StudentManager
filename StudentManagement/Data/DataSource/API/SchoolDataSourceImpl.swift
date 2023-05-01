//
//  SchoolDataSourceImpl.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/30.
//

import Foundation
import Combine
import RealmSwift

struct SchoolDataSourceImpl: SchoolDataSource {
    enum SchoolRepositoryError: Error {
        case realmError(error: Error)
        case schoolNotFound
    }
    
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func fetchSchools() -> Future<[School], Error> {
        let schools = realm.objects(School.self)
        return Future { promise in
            promise(.success(Array(schools)))
        }
    }
    
    func addSchool(name: String) -> Future<Void, Error> {
        
        return Future { promise in
            do {
                try realm.write {
                    let school = School()
                    school.name = name
                    realm.add(school)
                }
                promise(.success(()))
            } catch let error {
                promise(.failure(SchoolRepositoryError.realmError(error: error)))
            }
        }
    }
    
    
    func updateSchool(id: String, name: String) -> Future<Void, Error> {
            guard let school = realm.object(ofType: School.self, forPrimaryKey: id) else {
                return Future { promise in
                    promise(.failure(SchoolRepositoryError.schoolNotFound))
                }
            }
            
            return Future { promise in
                do {
                    try realm.write {
                        school.name = name
                    }
                    promise(.success(()))
                } catch let error {
                    promise(.failure(SchoolRepositoryError.realmError(error: error)))
                }
            }
        }
    
    func deleteSchool(id: String) -> Future<Void, Error> {
        return Future { promise in
            // Delete the school object
            let realm = try! Realm()
            guard let schoolToDelete = realm.object(ofType: School.self, forPrimaryKey: id) else {
                promise(.failure(SchoolRepositoryError.schoolNotFound))
                return
            }
            try! realm.write {
                realm.delete(schoolToDelete)
            }
            
            // Find and delete all classes related to the school
            let classesToDelete = realm.objects(Clazz.self).filter("schoolID == %@", id)
            try! realm.write {
                realm.delete(classesToDelete)
            }
            
            promise(.success(()))
        }
    }

    
    enum SchoolError: Error {
        case schoolNotFound
    }
    
}
