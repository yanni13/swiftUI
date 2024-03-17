import SwiftUI

struct ContentView: View {
    @ObservedObject var boardData = BoardData()
    
    private var leftItems: [Board] {
        Array(boardData.boards.prefix(upTo: boardData.boards.count/2))
    }
    
    private var rightItems: [Board] {
        Array(boardData.boards.suffix(from: boardData.boards.count/2))
    }
    
    var body: some View {
        let columns = [GridItem(.flexible(minimum: 10, maximum: .infinity))]
        
        NavigationView {
            ScrollView {
                HStack(alignment: .top, spacing: -20) {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(leftItems) { item in
                                VStack {
                                    if let image = item.image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .cornerRadius(10)
                                    }
                                    Text(item.title)
                                        
                                }
                                
                            }
                        }
                        .padding()
                    }
                    
                    VStack(spacing: 20.0) {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(rightItems) { item in
                                VStack {
                                    if let image = item.image {
                                        
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .cornerRadius(10)
                                    }
                                    Text(item.title)
                                    
                                }
                            }
                        }
                        .padding()
                    }
                }
                .navigationBarTitle(Text("Pinterest"), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: DetailView(boardData: boardData)) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.red)
                        .font(.title)
                })
            }
        }
    }
}


