////
////  SchoolRepositoryImpl.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/23.
////
//
//import Foundation
//import RealmSwift
//import Combine
//
//struct SchoolRepositoryImpl: SchoolRepository {
//
//    let dataSource: SchoolDataSource
//
//    func getSchools() -> AnyPublisher<[School], Error> {
//        dataSource.getSchools()
//    }
//
//    func addSchool(school: School) -> AnyPublisher<Void, Error> {
//        dataSource.addSchool(school: school)
//    }
//
//    func updateSchool(school: School) -> AnyPublisher<Void, Error> {
//        dataSource.updateSchool(school: school)
//    }
//
//    func deleteSchool(school: School) -> AnyPublisher<Void, Error> {
//        dataSource.deleteSchool(school: school)
//    }
//
//
//}
