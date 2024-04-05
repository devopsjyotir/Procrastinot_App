//
//  ContentView.swift
//  Procrastinot_App
//
//  Created by Jyotir McEwan-Anamoah on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
