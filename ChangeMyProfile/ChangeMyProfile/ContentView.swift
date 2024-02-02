//
//  ContentView.swift
//  ChangeMyProfile
//
//  Created by 아우신얀 on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var openPhoto = false
    @State var image: UIImage?
    @State var name = ""
    @State private var showing = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Button("저장") {
                    showing = true
                }
                .alert(isPresented: $showing) {
                    Alert(title: Text("저장"), message: Text("저장 되었습니다!"))
                }
                .frame(width: 350, height: 50, alignment: .trailing)
                .padding()
                
                Button(action: {
                    self.openPhoto.toggle()
                }, label: {
                    let selected = image == nil ? Image("Image") : Image(uiImage: image!)
                    selected
                        .resizable()
                        .frame(width: 200, height: 200)
                })
                
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.black, lineWidth: 4)
                }
                .sheet(isPresented: $openPhoto) {
                    SUImagePicker(sourceType: .photoLibrary) { (image) in
                        self.image = image
                    }
                }
                
                TextField("이름", text: $name)
                    .frame(width: 300, height: 70, alignment: .center)
                    .padding()
                
            }
            Spacer()
        }
        
    }
    
}

#Preview {
    ContentView()
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
