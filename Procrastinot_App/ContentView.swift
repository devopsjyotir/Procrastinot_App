//
//  ContentView.swift
//  Procrastinot_App
//
//  Created by Jyotir McEwan-Anamoah on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentDate: Date = .init()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            VStack(alignment: .leading, content: {
                Text("April")
                    .font(.system(size: 36, weight: .semibold))
                
                
            })
            .padding()
            .background(.pink.opacity(0.0))
            .clipShape(.rect(cornerRadius: 10))
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}

