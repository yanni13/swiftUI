//
//  ContentView.swift
//  increaseCount
//
//  Created by 아우신얀 on 3/11/24.
//

import Combine
import SwiftUI

struct ContentView: View {
    
    
    var vm = CombineViewModel()
    @State var anyCancellable = Set<AnyCancellable>()
    @State var number = 0
    
    var body: some View {
        VStack {
            Text("John Appleseed, Age: \(number)")
                .padding()
            
            Button(action: {
                vm.number.value += 1
                //print(vm.number.value)
            }, label: {
                Text("Celebrate Birthday")
            })
            .onAppear {
                vm.number.sink { [self]  value in
                    DispatchQueue.main.async {
                        self.number = value
                    }
                }.store(in: &anyCancellable)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
