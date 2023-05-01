//
//  AddSchoolViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/30.
//

import Foundation
import Combine

class AddSchoolViewModel: ObservableObject {
    static let addedSchool = PassthroughSubject<Void, Never>()
    private let getSchoolUseCases = GetSchoolUseCase(repository: SchoolRepositoryImpl(dataSource: SchoolDataSourceImpl()))
    private var addSchoolUseCases = AddSchoolUseCase(repository: SchoolRepositoryImpl(dataSource: SchoolDataSourceImpl()))
    private var cancellables = Set<AnyCancellable>()
    
    @Published var schoolName = ""
    
    func addSchool() {
        addSchoolUseCases.execute(name: schoolName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    AddSchoolViewModel.addedSchool.send()
                    print("AddSchoolViewModel.addedSchool.send()")
                }
            }, receiveValue: { _ in
                self.schoolName = ""
            })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
