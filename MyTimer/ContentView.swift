//
//  ContentView.swift
//  MyTimer
//
//  Created by Oleg Lesnoy on 27.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(viewModel.time)")
            Button("Run", action: {
                viewModel.getDate(after: 3)
            })
            
            Button("Stop", action: {
                viewModel.stopGetDate()
            })
        }
    }
}

#Preview {
    ContentView()
}
