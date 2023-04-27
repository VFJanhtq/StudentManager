////
////  SchoolRepositoryImpls.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/24.
////
//
//import Foundation
//import Combine
//import RealmSwift
//
//class SchoolRepositoryImpl: SchoolRepository {
//    
//    let realm: Realm
//    
//    init() {
//        realm = try! Realm()
//    }
//
//    
//    func fetchSchools() -> AnyPublisher<[School], Error> {
//        let schools = realm.objects(School.self)
//        return schools.collectionPublisher
//            .map { Array($0) }
//            .map { $0.map { School(name: $0.name) } }
//            .eraseToAnyPublisher()
//    }
//    
//    
//    func addSchool(name: String) -> AnyPublisher<Void, Error> {
//        let school = School()
//        school.name = name
//        
//        do {
//            try realm.write {
//                realm.add(school)
//            }
//            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
//        } catch {
//            return Fail(error: error).eraseToAnyPublisher()
//        }
//    }
//    
//    func updateSchool(id: String, name: String) -> AnyPublisher<Void, Error> {
//        guard let school = realm.object(ofType: School.self, forPrimaryKey: id) else {
//            let error = NSError(domain: "School not found", code: 404, userInfo: nil)
//            return Fail(error: error).eraseToAnyPublisher()
//        }
//        
//        do {
//            try realm.write {
//                school.name = name
//            }
//            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
//        } catch {
//            return Fail(error: error).eraseToAnyPublisher()
//        }
//    }
//    
//    func deleteSchool(id: String) -> AnyPublisher<Void, Error> {
//        guard let school = realm.object(ofType: School.self, forPrimaryKey: id) else {
//            let error = NSError(domain: "School not found", code: 404, userInfo: nil)
//            return Fail(error: error).eraseToAnyPublisher()
//        }
//        
//        do {
//            try realm.write {
//                realm.delete(school)
//            }
//            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
//        } catch {
//            return Fail(error: error).eraseToAnyPublisher()
//        }
//    }
//
//}
