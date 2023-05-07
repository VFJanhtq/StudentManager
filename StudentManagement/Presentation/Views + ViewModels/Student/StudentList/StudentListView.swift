//
//  StudentListview.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import SwiftUI

struct StudentListView: View {
    @ObservedObject var viewModel: StudentViewModel
    @State var isPresented = false

    var body: some View {
        List(viewModel.students, id: \.id) { student in
            Text(student.name)
//            Text(student.age)
        }
        .navigationBarTitle("\(viewModel.name) Clazz")
        .sheet(isPresented: $isPresented, onDismiss: {
//            self.viewModel.apply(inputs: .getStudent(viewModel.id))
            print("sheet: fetchStudent")
        }, content: {
            AddStudentView(viewModel: AddStudentViewModel(clazzID: viewModel.id))
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                self.viewModel.apply(inputs: .getStudent(viewModel.id))
            }
        }
    }
}
