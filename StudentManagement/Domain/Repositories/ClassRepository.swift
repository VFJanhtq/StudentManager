////
////  ClassRepository.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/20.
////
//
//import Foundation
//import RealmSwift
//import Combine
//
//protocol ClassRepositoryProtocol {
//    func createClass(name: String, school: SchoolEntity, completion: @escaping (Result<Void, Error>) -> Void)
//    func deleteClass(cls: ClassEntity, completion: @escaping (Result<Void, Error>) -> Void)
//    func getAllClasses(for school: SchoolEntity) -> AnyPublisher<[ClassEntity], Error>
//    }
//
//class ClassRepository: ClassRepositoryProtocol {
//    private let realm: Realm
//    init(realm: Realm) {
//        self.realm = realm
//    }
//    
//    func createClass(name: String, school: SchoolEntity, completion: @escaping (Result<Void, Error>) -> Void) {
//        let cls = ClassEntity()
//        cls.name = name
//        
//        do {
//            try realm.write {
//                school.classes.append(cls)
//                realm.add(cls)
//                completion(.success(()))
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
//    func deleteClass(cls: ClassEntity, completion: @escaping (Result<Void, Error>) -> Void) {
//        do {
//            try realm.write {
//                realm.delete(cls.students)
//                realm.delete(cls)
//                completion(.success(()))
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
//    func getAllClasses(for school: SchoolEntity) -> AnyPublisher<[ClassEntity], Error> {
//        let predicate = NSPredicate(format: "ANY school.id == %@", school.id)
//        return realm.objects(ClassEntity.self)
//            .filter(predicate)
//            .collectionPublisher
//            .map { Array($0) }
//            .eraseToAnyPublisher()
//    }
//}
