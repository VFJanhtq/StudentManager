//
//  AddClazzUseCase.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/30.
//

import Foundation
import Combine

struct AddClazzUseCase {
    var repository: ClazzRepository
    
    func execute(name: String, for schoolID: String) -> Future<Void, Error> {
        return repository.addClazz(name: name, for: schoolID)
    }
    
}
