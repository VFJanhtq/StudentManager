//
//  StudentRepositoryImpl.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import Foundation
import Combine

struct StudentRepositoryImpl: StudentRepository {
    var datasource: StudentDataSource
    
    func fetchStudent(for clazzID: String) -> Future<[Student], Error> {
        datasource.fetchStudent(for: clazzID)
    }
    
    func addStudent(name: String, age: Int, for clazzID: String) -> Future<Void, Error> {
        datasource.addStudent(name: name, age: age, for: clazzID)
    }
    
    func updateStudent(id: String, name: String) -> Future<Void, Error> {
        datasource.updateStudent(id: id, name: name)
    }
    
    func deleteStudent(id: String) -> Future<Void, Error> {
        datasource.deleteStudent(id: id)
    }
}


