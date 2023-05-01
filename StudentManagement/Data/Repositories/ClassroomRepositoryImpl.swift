//
//  ClassRepositoryImpl.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import Foundation
import Combine

struct ClazzRepositoryImpl: ClazzRepository {
    var dataSource: ClazzDataSource
    
    func fetchClazzes(for schoolID: String) -> Future<[Clazz], Error> {
        dataSource.fetchClazzes(for: schoolID)
    }
    
    func addClazz(name: String, for schoolID: String) -> Future<Void, Error> {
        dataSource.addClazz(name: name, for: schoolID)
    }
    
    func updateClazz(id: String, name: String) -> Future<Void, Error> {
        dataSource.updateClazz(id: id, name: name)
    }
    
    func deleteClazz(id: String) -> Future<Void, Error> {
        dataSource.deleteClazz(id: id)
    }
    
    
    
}
