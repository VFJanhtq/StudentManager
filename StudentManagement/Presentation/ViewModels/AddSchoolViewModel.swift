//
//  AddSchoolViewModel.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/24.
//

import SwiftUI
import RealmSwift
import Combine


//struct AddSchoolView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @StateObject var viewModel: SchoolViewModel
//    @State private var schoolName = ""
//    @State private var schoolAddress = ""
//
//    var body: some View {
//        Form {
//            TextField("School name", text: $schoolName)
//            TextField("School address", text: $schoolAddress)
//            Button("Save") {
//                viewModel.createSchool(name: schoolName, address: schoolAddress)
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
//        .navigationBarTitle("Add School")
//    }
//}
