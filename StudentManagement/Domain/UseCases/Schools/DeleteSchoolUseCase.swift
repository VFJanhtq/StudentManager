//
//  DeleteSchoolUseCase.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/23.
//

import Foundation
import RealmSwift
import Combine

struct DeleteSchoolUseCase: DeleteSchool {
    let repository: SchoolRepository

    func execute(id: String) -> Future<Void, Error> {
        return repository.deleteSchool(id: id)
    }
}

protocol DeleteSchool {
    func execute(id: String) -> Future<Void, Error>
}
