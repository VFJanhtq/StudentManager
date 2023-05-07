//
//  ClassListView.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/25.
//

import Foundation
import SwiftUI


struct ClazzListView: View {
    @ObservedObject var viewModel: ClazzViewModel
    @State var isPresented = false
    
    var body: some View {
        List(viewModel.classes, id: \.id) { cls in
            NavigationLink(destination: StudentListView(viewModel: StudentViewModel(clazzID: cls.id, clazzName: cls.name))) {
                Text(cls.name)
            }
        }
        .navigationBarTitle("\(viewModel.name) School")
        .sheet(isPresented: $isPresented, onDismiss: {
            self.viewModel.apply(inputs: .getClazz(viewModel.id))
            print("sheet: fetchClazz")
        }, content: {
            AddClassView(viewModel: AddClazzViewModel(schoolID: viewModel.id))
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
                self.viewModel.apply(inputs: .getClazz(viewModel.id))
            }
        }
    }
}
