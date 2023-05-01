//
//  ClassUseCases.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import Combine

struct GetClazzUseCase {
    var repository: ClazzRepository
    
    func execute(for schoolID: String) -> Future<[Clazz], Error> {
        return repository.fetchClazzes(for: schoolID)
    }
    
}
