//
//  ContentView.swift
//  emojis
//
//  Created by Wildan on 21/01/24.
//

import SwiftUI

enum Emoji:String, CaseIterable{
    case 😀
    case 😆
    case 😃
}

struct ContentView: View {
    
    @State var selection: Emoji = .😃

    var body: some View {
        VStack {
            Text(selection.rawValue).font(.system(size: 100))
            Picker("Select Emoji", selection: $selection){
                ForEach(Emoji.allCases, id: \.self){ emoji in
                    Text(emoji.rawValue)
                }
            }.pickerStyle(.segmented)
        }.padding()
    }
}

#Preview {
    ContentView()
}
