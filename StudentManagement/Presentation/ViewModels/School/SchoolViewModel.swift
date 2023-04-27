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
    enum inputOption {
        case fetchSchool
        case addSchool(name: String)
        
    }
    
    private let getSchoolUseCases = SchoolRepository()
    private let getClassUsecases = ClassRepository()
    private var cancellables = Set<AnyCancellable>()
    private var destinationView: AnyView = AnyView(EmptyView())
    
    @Published var schools: [School] = []
    
    func apply(inputs: inputOption) {
        switch inputs {
        case .fetchSchool:
            fetchSchool()
            
        case let .addSchool(name: String):
            addSchool(name: String)
            
        }
    }
    func fetchSchool() {
        getSchoolUseCases.fetchSchools()
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
    
    func getDestinationView() -> AnyView {
        return destinationView
    }
    
    func addSchool(name: String) {
        getSchoolUseCases.addSchool(name: name)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    func updateSchool(id: String, name: String) {
        getSchoolUseCases.updateSchool(id: id, name: name)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    func deleteSchool(id: String) {
        getSchoolUseCases.deleteSchool(id: id)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
}


