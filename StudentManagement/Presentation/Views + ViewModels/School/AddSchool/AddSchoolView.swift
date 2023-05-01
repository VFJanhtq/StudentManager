

import Foundation
import SwiftUI
import RealmSwift

struct AddSchoolView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddSchoolViewModel

    var body: some View {
        Form {
            TextField("School Name", text: $viewModel.schoolName)
            Button{
                viewModel.addSchool()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
            }
            }
    }
}

//struct AddSchoolView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSchoolView(viewModel: AddSchoolViewModel(addSchoolUseCases: AddSchoolUseCase())
//    }
//}
