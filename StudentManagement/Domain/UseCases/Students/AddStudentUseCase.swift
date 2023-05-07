//
//  AddStudentUseCase.swift
//  StudentManagement
//
//  Created by anhtq on R 5/05/07.
//

import Foundation
import Combine

struct AddStudentUseCase {
    var repository: StudentRepository
    
    func execute(name: String, age: Int, for clazzID: String) -> Future<Void, Error> {
        return repository.addStudent(name: name, age: age, for: clazzID)
    }
}
