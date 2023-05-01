//
//  Schoolview.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/23.
//

import Foundation
import SwiftUI
import Combine

struct SchoolListView: View {
    @ObservedObject var viewModel: SchoolViewModel
    @State private var isPresented: Bool = false
    var body: some View {
        VStack{
            List {
                ForEach(viewModel.schools, id: \.self) { school in
                    NavigationLink(destination: ClazzListView(viewModel: ClazzViewModel(schoolID: school.id, schoolName: school.name))) {
                        VStack(alignment: .leading) {
                            Text(school.name)
                            Text("ID : \(school.id)")
                                .opacity(0.4)
                        }
                    }
                }
                .onDelete { indexSet in
                    guard let index = indexSet.first else {
                        return
                    }
                    let school = viewModel.schools[index]
                    self.viewModel.apply(inputs: .delSchool(school.id))
                    
                }
                
                //                .onReceive(AddSchoolViewModel.addedSchool) { _ in
                //                    viewModel.apply(inputs: .fetchSchool)
                //                }
                
            }
            //            .onReceive($isPresented, perform: { schools in
            //                print("aaaa")
            //            })
            
            .navigationBarTitle("Schools")
            //            .navigationBarItems(trailing:
            //                                    Button(action: {
            //                self.isPresented = true
            //            }, label: {
            //                Image(systemName: "plus")
            //            })
            //            )
            //            .sheet(isPresented: $isPresented, content: {
            //                AddSchoolView(viewModel: AddSchoolViewModel())
            //
            //            })
            
            .sheet(isPresented: $isPresented, onDismiss: {
                self.viewModel.apply(inputs: .fetchSchool)
                print("sheet: fetchSchool")
            }, content: {
                AddSchoolView(viewModel: AddSchoolViewModel())
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
                    self.viewModel.apply(inputs: .fetchSchool)
                }
            }
        }
        
        
    }
    
    //    init(viewModel: SchoolViewModel) {
    //        self.viewModel = viewModel
    //    }
    //
}











