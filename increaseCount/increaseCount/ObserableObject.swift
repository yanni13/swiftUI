import SwiftUI
import Combine

class Contact: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func haveBirthday() -> Int {
        age += 1
        return age
    }
}

struct ObserableObject: View {
    @StateObject private var john = Contact(name: "John Appleseed", age: 23)

    var body: some View {
        VStack {
            Text("\(john.name), Age: \(john.age)")
                .padding()
            Button("Celebrate Birthday") {
                let newAge = john.haveBirthday()
                print("New age is \(newAge)")
            }
        }
        .onAppear {
            let cancellable = john.objectWillChange.sink { _ in
                print("\(john.age) will change")
            }
        }
    }
}

struct ObserableObject_Previews: PreviewProvider {
    static var previews: some View {
        ObserableObject()
    }
}

