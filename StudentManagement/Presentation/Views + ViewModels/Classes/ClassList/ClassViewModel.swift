//
//  ClassViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/24.
//

import Foundation
import Combine

class ClazzViewModel: ObservableObject {
    enum Inputs {
        case getClazz(String)
        case DelClazz
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let getClazzUseCase = GetClazzUseCase(repository: ClazzRepositoryImpl(dataSource: ClazzDataSourceImpl()))
    private let deleteClazzUseCase = DeleteClazzUseCase(repository: ClazzRepositoryImpl(dataSource: ClazzDataSourceImpl()))
    
    @Published var classes: [Clazz] = []
    var id: String
    var name: String
    
    init(schoolID: String, schoolName: String) {
        self.id = schoolID
        self.name = schoolName
    }
    
    func apply(inputs: Inputs) {
        switch inputs {
        case .getClazz(let schoolID):
            print("get Clazz")
            fetchClasses(for: schoolID)
        case .DelClazz:
            print("DelClazz")
        }
    }
    
    private func fetchClasses(for schoolID: String) {
        getClazzUseCase.execute(for: schoolID)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] classes in
                self?.classes = classes
            }
            .store(in: &cancellables)
    }
    
    
    
    //    func updateClass(id: String, name: String) {
    //        getClassUseCase.updateClass(classID: id, name: name)
    //            .sink { completion in
    //                if case let .failure(error) = completion {
    //                    print("Error: \(error.localizedDescription)")
    //                }
    //            } receiveValue: { _ in }
    //            .store(in: &cancellables)
    //    }
    
    func deleteClass(id: String) {
        deleteClazzUseCase.execute(id: id)
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
