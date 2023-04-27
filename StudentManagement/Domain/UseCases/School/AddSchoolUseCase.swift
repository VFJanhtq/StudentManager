////
////  AddSchoolUseCase.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/23.
////
////
//import Foundation
//import RealmSwift
//import Combine
//
//struct AddSchoolUseCase: AddSchools {
//    var repository: SchoolRepository
//    
//    func execute(school: School) -> AnyPublisher<Void, Error> {
//            return repository.addSchool(school: school)
//    }
//    
//}
//
//protocol AddSchools {
//    func execute(school: School) -> AnyPublisher<Void, Error>
//}
