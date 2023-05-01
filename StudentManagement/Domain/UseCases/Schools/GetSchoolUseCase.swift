//
//  GetAllSchoolUseCase.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/23.
//

import Foundation
import Combine
import RealmSwift

struct GetSchoolUseCase: GetSchool {
    
    var repository: SchoolRepository
    
    func execute() -> Future<[School], Error> {
        return repository.fetchSchools()
    }
}

protocol GetSchool {
    func execute() -> Future<[School], Error>
}
