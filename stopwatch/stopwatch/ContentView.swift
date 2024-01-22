//
//  ContentView.swift
//  stopwatch
//
//  Created by 아우신얀 on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stopWatch = Stop_Watch()
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                VStack (alignment: .center){
                    
                    Button("reset") {
                        self.stopWatch.reset()
                    }
                    
                    .position(x:350, y:20)
                    .font(.system(size: 25.0))
                    
4                    let minutes = String(format: "%02d", stopWatch.counter / 60)
                    let seconds = String(format: "%02d", stopWatch.counter % 60)
                    let union = minutes + " : " + seconds
                   
                    Text("\(union)")
                        .foregroundColor(.white)
                        .font(.custom("", size: 90))
                        .position(x:200, y:0)
                }
                
                GeometryReader { g in
                    HStack (spacing: 0){
                        ZStack {
                            Rectangle()
                                .fill(.purple)
                            Button(action: {
                                self.stopWatch.start()
                            }, label: {
                                Image(systemName: "play")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            })
                            
                        }
                        
                        .frame(width: g.size.width/2, height: 450)
                        
                        
                        ZStack {
                            Rectangle()
                                .fill(.green)
                            Button(action: {
                                self.stopWatch.stop()
                            }, label: {
                                Image(systemName: "pause")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            })
                            
                        }
                        .frame(width: g.size.width/2, height: 450)
                        
                        
                    }
                }
            }
            
            
        }
        
        
    }
    
}

class Stop_Watch: ObservableObject {
    @Published var counter: Int = 0
    
    var timer = Timer()
    
    func start() { //타이머 시작
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.counter += 1
        }
    }
    
    func stop() { // 타이머 중지
        self.timer.invalidate()
    }
    
    func reset() { //타이머 초기화
        self.counter = 0
        self.timer.invalidate()
    }
}

#Preview {
    ContentView()
}
