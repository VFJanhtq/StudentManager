//
//  SchoolViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/23.
//

import Foundation
import RealmSwift
import Combine
import SwiftUI

class SchoolViewModel: ObservableObject {
    enum Inputs {
        case fetchSchool
        case delSchool(String)
        
    }
    //Refresh SchoolList
    private var addSchoolSubscriber: AnyCancellable?
    private let schoolAdded = PassthroughSubject<Void, Never>()
    
    // UseCase
    private let getSchoolUseCase = GetSchoolUseCase(repository: SchoolRepositoryImpl(dataSource: SchoolDataSourceImpl()))
    private let deleteSchoolUseCase = DeleteSchoolUseCase(repository: SchoolRepositoryImpl(dataSource: SchoolDataSourceImpl()))
    private let deleteClazzUseCase = DeleteClazzUseCase(repository: ClazzRepositoryImpl(dataSource: ClazzDataSourceImpl()))
    private var cancellables = Set<AnyCancellable>()
    
    @Published var schools: [School] = []
    
    func apply(inputs: Inputs) {
        switch inputs {
        case .fetchSchool:
            print("fetchSchool")
            fetchSchool()
        case .delSchool(let id):
            print("delSchool")
            deleteSchool(id: id)
        }
    }
    
    func fetchSchool() {
        getSchoolUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { schools in
                self.schools = schools
            }
            .store(in: &cancellables)
    }
    
    //    func updateSchool(id: String, name: String) {
    //        getSchoolUseCases.updateSchool(id: id, name: name)
    //            .sink { completion in
    //                if case let .failure(error) = completion {
    //                    print("Error: \(error.localizedDescription)")
    //                }
    //            } receiveValue: { _ in }
    //            .store(in: &cancellables)
    //    }
    
    func deleteSchool(id: String) {
        deleteSchoolUseCase.execute(id: id)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: {_ in }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}



