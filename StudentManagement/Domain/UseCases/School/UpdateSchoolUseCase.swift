////
////  UpdateSchoolUseCase.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/23.
////
//
//import Foundation
//import RealmSwift
//import Combine
//
//struct UpdateSchoolUseCase: UpdateSchools {
//
//    var repository: SchoolRepository
//
//    func execute(school: School) -> AnyPublisher<Void, Error> {
//            return repository.updateSchool(school: school)
//    }
//
//}
//
//protocol UpdateSchools {
//    func execute(school: School) -> AnyPublisher<Void, Error>
//}
