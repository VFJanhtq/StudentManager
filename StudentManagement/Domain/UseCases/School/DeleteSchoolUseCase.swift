////
////  DeleteSchoolUseCase.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/23.
////
//
//import Foundation
//import RealmSwift
//import Combine
//
//struct DeleteSchoolUseCase: DeleteSchool {
//    let repository: SchoolRepository
//
//    func execute(school: School) -> AnyPublisher<Void, Error> {
//            return repository.deleteSchool(school: school)
//    }
//}
//
//protocol DeleteSchool {
//    func execute(school: School) -> AnyPublisher<Void, Error>
//}
