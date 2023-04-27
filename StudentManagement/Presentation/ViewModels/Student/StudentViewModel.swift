//
//  StudentViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/24.
//

import Foundation
import Combine

class StudentViewModel: ObservableObject {
     let studentUseCases: StudentUseCases
    private var cancellables = Set<AnyCancellable>()
    @Published var students: [Student] = []
    
    init(studentUseCases: StudentUseCases, cls: Class) {
        self.studentUseCases = studentUseCases
        
        studentUseCases.fetchStudents(classID: cls.id)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { students in
                self.students = students
            }
            .store(in: &cancellables)
    }
    func addStudent(name: String, age: Int, cls: Class) {
        studentUseCases.addStudent(classID: cls.id, name: name, age: age)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    func updateStudent(id: String, name: String, age: Int) {
        studentUseCases.updateStudent(id: id, name: name, age: age)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    func deleteStudent(id: String) {
        studentUseCases.deleteStudent(id: id)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
}
