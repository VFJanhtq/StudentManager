////
////  EditSchoolViewModel.swift
////  StudentManagement
////
////  Created by anhtq on R 5/04/24.
////
//
//import Foundation
//import RealmSwift
//import Combine
//
//class EditSchoolViewModel: ObservableObject {
//    private var repository: SchoolRepository
//    private var cancellables: Set<AnyCancellable> = []
//
//    @Published var name = ""
//    @Published var address = ""
//    @Published var school: School
//    @Published var errorMessage: String?
//
//    init(repository: SchoolRepository, school: School) {
//        self.repository = repository
//        self.school = school
//        self.name = school.name
//        self.address = school.address
//    }
//
//    func updateSchool() {
//        school.name = name
//        school.address = address
//
//        repository.updateSchool(school: school)
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] completion in
//                switch completion {
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                case .finished:
//                    break
//                }
//            } receiveValue: { _ in }
//            .store(in: &cancellables)
//    }
//}
