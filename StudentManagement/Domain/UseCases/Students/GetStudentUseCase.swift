//
//  StudentUseCases.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import Combine


struct GetStudentUseCase {
    var repository: StudentRepository
    
    func execute(for clazzID: String) -> Future<[Student], Error> {
        return repository.fetchStudent(for: clazzID)
    }
}

