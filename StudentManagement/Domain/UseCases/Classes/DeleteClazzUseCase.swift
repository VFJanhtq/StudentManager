//
//  DeleteClazzUseCase.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/30.
//

import Foundation
import Combine

struct DeleteClazzUseCase {
    var repository: ClazzRepository
    
    func execute(id: String) -> Future<Void, Error> {
        return repository.deleteClazz(id: id)
    }
}
