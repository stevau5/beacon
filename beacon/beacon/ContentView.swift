//
//  ContentView.swift
//  beacon
//
//  Created by Steven Zanga on 2020-03-03.
//  Copyright © 2020 Steven Anthony Zanga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
            Spacer()
            VStack {
                    Text("BEACON")
                        .font(.title)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)

                    Text("where we dropping")
                        .font(.subheadline)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
