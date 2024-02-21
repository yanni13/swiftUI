//
//  DetailView.swift
//  Pinterest
//
//  Created by 아우신얀 on 2/15/24.
//

import SwiftUI

struct Board: Identifiable {
    let id: UUID = UUID()
    var title : String
}

struct DetailView: View {
    
    @State var title = ""
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
                        SUImagePicker(sourceType: .photoLibrary) { (image) in
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
                    showing = true
                }
            })
        
        }
    }
}

#Preview {
    DetailView()
}


struct SUImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    @Environment(\.presentationMode)
    private var presentationMode // 해당 뷰컨트롤러의 노출 여부
    let sourceType: UIImagePickerController.SourceType
    let imagePicked: (UIImage) -> () // 이미지가 선택됐을때 결과 호출
    

    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: SUImagePicker
        
        init(parent: SUImagePicker) {
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
