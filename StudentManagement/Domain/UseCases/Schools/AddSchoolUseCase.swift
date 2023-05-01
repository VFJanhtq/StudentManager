//
//  AddSchoolUseCase.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/23.
//
//
import Foundation
import RealmSwift
import Combine

struct AddSchoolUseCase: AddSchool {
    var repository: SchoolRepository
    
    func execute(name: String) -> Future<Void, Error> {
        return repository.addSchool(name: name)
    }
    
}

protocol AddSchool {
    func execute(name: String) -> Future<Void, Error>
}
