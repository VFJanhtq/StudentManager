//
//  ClazzDataSource.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/30.
//

import Foundation
import Combine

protocol ClazzDataSource {
    func fetchClazzes(for schoolID: String) -> Future<[Clazz], Error>
    func addClazz(name: String, for schoolID: String) -> Future<Void, Error>
    func updateClazz(id: String, name: String) -> Future<Void, Error>
    func deleteClazz(id: String) -> Future<Void, Error>
}
