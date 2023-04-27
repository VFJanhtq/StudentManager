//
//  ContentView.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/20.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @StateObject var viewModel = SchoolViewModel()
    var body: some View {
        NavigationView {
            SchoolListView(viewModel: SchoolViewModel(), school: School())
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
