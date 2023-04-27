

import Foundation
import SwiftUI
import RealmSwift

struct AddSchoolView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SchoolViewModel
    @State private var schoolName = ""
    @State private var schoolAddress = ""

    var body: some View {
        Form {
                TextField("School Name", text: $schoolName)
            Button{
                viewModel.addSchool(name: schoolName)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
            }
            }
    }
}

struct AddSchoolView_Previews: PreviewProvider {
    static var previews: some View {
        AddSchoolView(viewModel: SchoolViewModel())
    }
}
