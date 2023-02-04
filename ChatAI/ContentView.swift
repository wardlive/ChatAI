//
//  ContentView.swift
//  ChatAI
//
//  Created by Pavel Neprin on 2/3/23.
//

import OpenAISwift
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var models = [String]()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach(models, id: \.self) { string in
                    Text(string)
                }
                Spacer()
                HStack{
                    TextField("Ask me something", text: $text)
                        .padding(.vertical, 20)
                    
                    Button(action: {
                        sendArrow()
                    }, label: {
                        Image(systemName: "paperplane.circle.fill")
                            .rotationEffect(.degrees(45))
                            .font(.system(size: 30))
                    })
                }
            }
            .onAppear{
                withAnimation(.spring()) {
                    viewModel.setup()
                }
            }
            .navigationBarTitle("ChatAI")
            .padding()
        }
    }
    
    func sendArrow() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        models.append("Me: \(text)")
        viewModel.send(text: text) { response, messageType in
            DispatchQueue.main.async {
                self.models.append("ChatGPT:"+response)
                self.text = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
