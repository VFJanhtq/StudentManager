//
//  AddClassViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/27.
//

import Foundation
import Combine

class AddClazzViewModel: ObservableObject {
    static let addedClass = PassthroughSubject<Void, Never>()
    private let addClazzUseCase = AddClazzUseCase(repository: ClazzRepositoryImpl(dataSource: ClazzDataSourceImpl()))
    private let getClazzUseCase = GetClazzUseCase(repository: ClazzRepositoryImpl(dataSource: ClazzDataSourceImpl()))
    private var cancellables = Set<AnyCancellable>()
    
    @Published var className = ""
    var schoolID: String
    
    init (schoolID: String) {
        self.schoolID = schoolID
    }
    
    func addClazz() {
        addClazzUseCase.execute(name: className, for: schoolID)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
//                    AddClazzViewModel.addedClass.send()
                    print("AddSchoolViewModel.addedSchool.send()")
                }
            }, receiveValue: { _ in
                self.className = ""
            })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
