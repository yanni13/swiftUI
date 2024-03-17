//
//  DetailView.swift
//  Pinterest
//
//  Created by 아우신얀 on 2/15/24.
//

import SwiftUI

class BoardData: ObservableObject { //공유데이터 모델 정의
    @Published var boards: [Board] = []
}


struct Board: Identifiable {
    let id: UUID = UUID()
    var title : String
    var image :  UIImage?
}



struct DetailView: View {
    
    @ObservedObject var boardData: BoardData
    @Environment(\.presentationMode) var presentationMode
    @State var title: String = ""
    @State private var showing = false
    @State var image: UIImage?
    @State var openPhoto = false
    
    
    var body: some View {
        
        VStack {
            NavigationView {
                VStack(alignment: .center) {
                    Button(action: {
                        self.openPhoto.toggle()
                    }, label: {
                        let selected = image == nil ? Image("user") : Image(uiImage: image!)
                        selected
                            .resizable()
                            .frame(width: 250, height: 250)
                            .aspectRatio(contentMode: .fit)
                            
                    })
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle().stroke(.black, lineWidth: 5)
                            .frame(width: 250, height: 250)
                            .cornerRadius(5)
                            
                    }
                    .sheet(isPresented: $openPhoto) {
                        UImagePicker(sourceType: .photoLibrary) { (image) in
                            self.image = image
                        }
                    }
                    
                    TextField("내용을 입력해주세요.", text: $title, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .border(.gray)
                        .padding()
                       
                }

                
            }
            .navigationTitle(Text("핀 만들기"))
            .navigationBarItems(trailing:
                                    HStack {
                Spacer()
                Button("업로드") {
                    
                    let newBoard = Board(title: title, image: image)
                    boardData.boards.append(newBoard)
                    showing = true
                    presentationMode.wrappedValue.dismiss() //뷰 닫기
                    
                }
            })
            
        
        }
    }
}

#Preview {
    DetailView(boardData: BoardData())
}


struct UImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    @Environment(\.presentationMode)
    private var presentationMode
    let sourceType: UIImagePickerController.SourceType
    let imagePicked: (UIImage) -> ()
    

    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: UImagePicker
        
        init(parent: UImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage {
                parent.imagePicked(image)
                parent.presentationMode.wrappedValue.dismiss()
            }
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        
        picker.delegate = context.coordinator
        
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }

}
