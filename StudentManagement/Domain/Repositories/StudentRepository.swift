//
//  StudentRepository.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//


import Foundation
import Combine

protocol StudentRepository {
    func fetchStudent(for clazzID: String) -> Future<[Student], Error>
    func addStudent(name: String, age: Int, for clazzID: String) -> Future<Void, Error>
    func updateStudent(id: String, name: String) -> Future<Void, Error>
    func deleteStudent(id: String) -> Future<Void, Error>
}
