//
//  DeleteStudentUseCase.swift
//  StudentManagement
//
//  Created by anhtq on R 5/05/07.
//

import Foundation
import Combine

struct DeleteStudentUseCase {
    var repository: StudentRepository
    
    func execute(id: String) -> Future<Void, Error> {
        return repository.deleteStudent(id: id)
    }
}
