//
//  AddClassView.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/26.
//

import Foundation
import SwiftUI

struct AddClassView: View {
    @ObservedObject var viewModel: AddClazzViewModel
    @Environment(\.dismiss) var dismiss
    @State var isPresented = false
    
    var body: some View {
        Form {
            TextField("Class Name", text: $viewModel.className)
            Button{
                viewModel.addClazz()
                dismiss()
            } label: {
                Text("Save")
            }
        }
        
    }
}

