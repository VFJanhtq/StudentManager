//
//  StudentListview.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import Combine
import SwiftUI
import RealmSwift

struct StudentListView: View {
    @StateObject var viewModel: StudentViewModel
    @State var isAddStudentPresented = false

    var body: some View {
        List(viewModel.students, id: \.id) { student in
            Text(student.name)
        }
        .navigationBarTitle("Students")
        .navigationBarItems(trailing: Button(action: {
            isAddStudentPresented.toggle()
        }) {
            Text("Add")
        })
        .sheet(isPresented: $isAddStudentPresented) {
//            AddStudentView(viewModel: viewModel)
        }
    }
}
