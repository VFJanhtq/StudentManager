//
//  SchoolRepository.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import Foundation
import Combine

protocol SchoolRepository {
    func fetchSchools() -> Future<[School], Error>
    func addSchool(name: String) -> Future<Void, Error>
    func updateSchool(id: String, name: String) -> Future<Void, Error>
    func deleteSchool(id: String) -> Future<Void, Error>
}

