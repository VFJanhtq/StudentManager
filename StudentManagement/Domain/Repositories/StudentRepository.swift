////
////  StudentRepository.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/20.
////
//
//import Foundation
//import RealmSwift
//import Combine
//
//protocol StudentRepositoryProtocol {
//func createStudent(name: String, age: Int, cls: ClassEntity, completion: @escaping (Result<Void, Error>) -> Void)
//func deleteStudent(student: StudentEntity, completion: @escaping (Result<Void, Error>) -> Void)
//func getAllStudents(for cls: ClassEntity) -> AnyPublisher<[StudentEntity], Error>
//}
//
//class StudentRepository: StudentRepositoryProtocol {
//    private let realm: Realm
//    init(realm: Realm) {
//        self.realm = realm
//    }
//
//    func createStudent(name: String, age: Int, cls: ClassEntity, completion: @escaping (Result<Void, Error>) -> Void) {
//        let student = StudentEntity()
//        student.name = name
//        student.age = age
//
//        do {
//            try realm.write {
//                cls.students.append(student)
//                realm.add(student)
//                completion(.success(()))
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//
//    func deleteStudent(student: StudentEntity, completion: @escaping (Result<Void, Error>) -> Void) {
//        do {
//            try realm.write {
//                realm.delete(student)
//                completion(.success(()))
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
//    func getAllStudents(for cls: ClassEntity) -> AnyPublisher<[StudentEntity], Error> {
//        cls.students.collectionPublisher
//            .map { Array($0) }
//            .eraseToAnyPublisher()
//    }
//}
