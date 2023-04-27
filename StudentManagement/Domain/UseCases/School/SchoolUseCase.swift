////
////  GetAllSchoolUseCase.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/23.
////
//
//import Foundation
//import Combine
//import RealmSwift
//
//struct GetSchoolsUseCase: GetSchools {
//    
//    var repository: SchoolRepository
//    
//    func execute() -> AnyPublisher<[School], Error> {
//            return repository.getSchools()
//    }
//}
//
//protocol GetSchools {
//    func execute() -> AnyPublisher<[School], Error>
//}
