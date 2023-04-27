//
//  Schoolview.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/23.
//

import Foundation
import RealmSwift
import SwiftUI
import Combine


struct SchoolListView: View {
    @ObservedObject var viewModel: SchoolViewModel
    @State private var isPresented: Bool = false
    var school: School
    var body: some View {
        VStack{
            List(viewModel.schools, id: \.self) { school in
                NavigationLink(destination: ClassListView(viewModel: ClassViewModel(classUseCases: ClassRepository(), schoolID: school.id, schoolName: school.name))) {
                    Text(school.name)
                    Text(school.id)
                }
            }
            .navigationBarTitle("Schools")
            .sheet(isPresented: $isPresented, content: {
                AddSchoolView(viewModel: viewModel)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // action
                        isPresented = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    self.viewModel.fetchSchool()
                }
            }
        }
        
    }
    
}











