//
//  StudentViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/24.
//

import Foundation
import Combine

class StudentViewModel: ObservableObject {
    
    enum Inputs {
        case getStudent(String)
        case delStudent
    }
    private var cancellables = Set<AnyCancellable>()
    
    private var getStudentUseCase = GetStudentUseCase(repository: StudentRepositoryImpl(datasource: StudentDataSourceImpl()))
    private var deleteStudentUseCase = DeleteStudentUseCase(repository: StudentRepositoryImpl(datasource: StudentDataSourceImpl()))
    
    @Published var students: [Student] = []
    var id: String
    var name: String
    
    init(clazzID: String, clazzName: String) {
        self.id = clazzID
        self.name = clazzName
    }
    
    func apply(inputs: Inputs) {
        switch inputs {
        case .getStudent(let id):
            print("get Student")
            fetchStudents(for: id)
        case .delStudent:
            print("delStudent")
        }
    }
    
    
    private func fetchStudents(for clazzID: String) {
        getStudentUseCase.execute(for: clazzID)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] students in
                self?.students = students
            }
            .store(in: &cancellables)
    }
    
    
//    func updateStudent(id: String, name: String, age: Int) {
//        studentUseCases.updateStudent(id: id, name: name, age: age)
//            .sink { completion in
//                if case let .failure(error) = completion {
//                    print("Error: \(error.localizedDescription)")
//                }
//            } receiveValue: { _ in }
//            .store(in: &cancellables)
//    }
    
    func deleteStudent(id: String) {
        deleteStudentUseCase.execute(id: id)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
