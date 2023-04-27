//
//  AddClassView.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/26.
//

import Foundation
import SwiftUI

struct AddClassView: View {
    @StateObject var viewModel: ClassViewModel
    @Environment(\.dismiss) var dismiss
    @State var className = ""
    @State var schoolID: String
    @State var isPresented = false
    
    var body: some View {
        Form {
            TextField("Class Name", text: $className)
            Button{
                viewModel.addClass(name: className, schoolID: schoolID)
//                dismiss()
            } label: {
                Text("Save")
            }
        }
        
    }
}

