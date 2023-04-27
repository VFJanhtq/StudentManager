//
//  StudentManagementApp.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import SwiftUI
//import RealmSwift

@main
struct StudentManagementApp: App {
//    @StateObject private var schoolViewModel = SchoolViewModel(schoolUseCases: SchoolRepository())
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstrainBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
//            SchoolView()
//                .environmentObject(schoolViewModel)
        }
    }
}
