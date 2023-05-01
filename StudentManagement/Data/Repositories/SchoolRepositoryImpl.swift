//
//  SchoolRepositoryImpl.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/23.
//


import Foundation
import Combine

struct SchoolRepositoryImpl: SchoolRepository {
    var dataSource: SchoolDataSource
    
    func fetchSchools() -> Future<[School], Error> {
        dataSource.fetchSchools()
    }
    
    func addSchool(name: String) -> Future<Void, Error> {
        dataSource.addSchool(name: name)
    }
    
    func updateSchool(id: String, name: String) -> Future<Void, Error> {
        dataSource.updateSchool(id: id, name: name)
    }
    
    func deleteSchool(id: String) -> Future<Void, Error> {
        dataSource.deleteSchool(id: id)
    }
    
    
}
