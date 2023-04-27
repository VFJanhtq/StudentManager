//
//  ClassListView.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import SwiftUI


struct ClassListView: View {
    @ObservedObject var viewModel: ClassViewModel
    @State var isPresented = false

    var body: some View {
        List(viewModel.classes, id: \.id) { cls in
//            NavigationLink(destination: StudentListView(viewModel: StudentViewModel(schoolUseCases: viewModel.schoolUseCases, cls: cls))) {
//                Text(cls.name)
            Text(cls.name)
//            }
            
        }
        .navigationBarTitle("\(viewModel.schoolName) School")
        .navigationBarItems(trailing: Button(action: {
            isPresented.toggle()
        }) {
            Text("Add Class")
        })
        .sheet(isPresented: $isPresented) {
            AddClassView(viewModel: ClassViewModel(classUseCases: ClassRepository(), schoolID: viewModel.schoolID, schoolName: ""), schoolID: viewModel.schoolID)
        }
        .onAppear {
            DispatchQueue.main.async {
                self.viewModel.fetchClasses()
            }
        }
    }
}
