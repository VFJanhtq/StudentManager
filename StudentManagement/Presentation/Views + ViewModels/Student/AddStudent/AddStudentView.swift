//
//  AddStudentView.swift
//  StudentManagement
//
//  Created by anhtq on R 5/05/07.
//

import Foundation
import SwiftUI

struct AddStudentView: View {
    @ObservedObject var viewModel: AddStudentViewModel
    @Environment(\.dismiss) var dismiss
    @State private var ageString = "18"
    
    var body: some View {
        Form {
            TextField("Student Name", text: $viewModel.studentName)
            Stepper(value: $viewModel.studentAge, in: 1...100) {
//                            ageString = String(viewModel.studentAge)
                            Text("Age")
                        }
            Button{
                viewModel.addStudent()
                dismiss()
            } label: {
                Text("Save")
            }
        }
    }
}
