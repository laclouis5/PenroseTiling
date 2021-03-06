//
//  ContentView.swift
//  Shared
//
//  Created by Louis Lac on 24/01/2021.
//

import SwiftUI

struct MainView: View {
    @State private var tiles: [Tile] = .wheel
    @State private var subdivisions = 0
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                PenroseView(tiles: $tiles)
                captionView
                Spacer()
                buttonsView
                infoView
            }
            .padding()
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Penrose Pattern", displayMode: .inline)
        }
    }
    
    private var captionView: some View {
        Label("Tap a tile to subdivide it", systemImage: "info.circle")
            .font(.caption)
    }
    
    private var infoView: some View {
        Text("Total triangles: \(tiles.count)")
            .font(.headline)
    }
    
    private var buttonsView: some View {
        HStack {
            Button(action: {
                tiles = tiles.subdivide()
                subdivisions += 1
            }) {
                Text("Subdivide All")
                    .foregroundColor(backgroundColor)
                    .font(.headline)
                    .padding()
                    .background(Capsule().foregroundColor(primaryColor))
            }
            Spacer()
            Button(action: {
                tiles = .wheel
                subdivisions = 0
            }) {
                Text("Reset")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Capsule().foregroundColor(.red))
            }
        }
    }
    
    private var primaryColor: Color {
        switch colorScheme {
        case .light:
            return .black
        case .dark:
            return .white
        @unknown default:
            return .black
        }
    }
    
    private var backgroundColor: Color {
        switch colorScheme {
        case .light:
            return .white
        case .dark:
            return .black
        @unknown default:
            return .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
