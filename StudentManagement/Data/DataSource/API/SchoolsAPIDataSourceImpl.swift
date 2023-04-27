////
////  SchoolsAPIDataSourceImpl.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/24.
////
//
//import Foundation
//import Combine
//import RealmSwift
//
//class SchoolsAPIDataSourceImpl: SchoolDataSource {
//    private var realm: Realm {
//        do {
//            return try Realm()
//        } catch let error {
//            fatalError("Failed to create Realm instance: \(error)")
//        }
//    }
//    
//    func getSchools() -> AnyPublisher<[School], Error> {
//        Future<[School], Error> { [weak self] promise in
//            guard let self = self else { return }
//            do {
//                let schools = self.realm.objects(School.self)
//                let schoolsArray = Array(schools)
//                promise(.success(schoolsArray))
//            } catch let error {
//                promise(.failure(error))
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//    
//    func addSchool(school: School) -> AnyPublisher<Void, Error> {
//        Future<Void, Error> { [weak self] promise in
//            guard let self = self else { return }
//            do {
//                try self.realm.write {
//                    self.realm.add(school)
//                }
//                promise(.success(()))
//            } catch let error {
//                promise(.failure(error))
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//    
//    func updateSchool(school: School) -> AnyPublisher<Void, Error> {
//        Future<Void, Error> { [weak self] promise in
//            guard let self = self else { return }
//            do {
//                try self.realm.write {
//                    self.realm.add(school, update: .modified)
//                }
//                promise(.success(()))
//            } catch let error {
//                promise(.failure(error))
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//    
//    func deleteSchool(school: School) -> AnyPublisher<Void, Error> {
//        Future<Void, Error> { [weak self] promise in
//            guard let self = self else { return }
//            do {
//                try self.realm.write {
//                    self.realm.delete(school)
//                }
//                promise(.success(()))
//            } catch let error {
//                promise(.failure(error))
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//    
//    
//}
