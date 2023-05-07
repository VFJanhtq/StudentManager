//
//  AddStudentViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/05/07.
//

import Foundation
import Combine

class AddStudentViewModel: ObservableObject {
    
    private let addStudentUseCase = AddStudentUseCase(repository: StudentRepositoryImpl(datasource: StudentDataSourceImpl()))
    private var cancellables = Set<AnyCancellable>()
    @Published var studentName: String = ""
    @Published var studentAge: Int = 18
    var clazzID: String = ""
    
    init(clazzID: String) {
        self.clazzID = clazzID
    }
    
    func addStudent() {
        addStudentUseCase.execute(name: studentName, age: studentAge, for: clazzID)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
//                    AddClazzViewModel.addedClass.send()
                    print("AddStudentViewModel")
                }
            }, receiveValue: { _ in
                self.studentName = ""
                self.studentAge = 0
            })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
