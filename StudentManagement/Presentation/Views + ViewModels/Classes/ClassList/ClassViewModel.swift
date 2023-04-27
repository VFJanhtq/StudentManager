//
//  ClassViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/24.
//

import Foundation
import Combine
import RealmSwift

class ClassViewModel: ObservableObject {
//        private let getSchoolUseCase = SchoolRepository()
    //    private let getClassUseCase = ClassRepository()
    private var cancellables = Set<AnyCancellable>()
    private let getClassUseCase: ClassRepository
    
    
    @Published var classes: [Class] = []
    let schoolID: String
    var schoolName: String
    @Published var school: School?
    
    init(classUseCases: ClassRepository, schoolID: String, schoolName: String) {
        self.getClassUseCase = classUseCases
        self.schoolID = schoolID
        self.schoolName = schoolName
        self.fetchClasses()
    }
    
    enum Inputs {
        case fetchClasses
        case getDetailSchool
    }
    
    func fetchClasses() {
            getClassUseCase.fetchClasses(schoolID: schoolID)
                .sink { completion in
                    if case let .failure(error) = completion {
                        print("Error: \(error.localizedDescription)")
                    }
                } receiveValue: { [weak self] classes in
                    self?.classes = classes
                }
                .store(in: &cancellables)
        }
    
    func addClass(name: String, schoolID: String) {
        getClassUseCase.addClass(schoolID: schoolID, name: name)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    func updateClass(id: String, name: String) {
        getClassUseCase.updateClass(classID: id, name: name)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    func deleteClass(id: String) {
        getClassUseCase.deleteClass(classID: id)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
}
