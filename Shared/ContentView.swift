//
//  ContentView.swift
//  Shared
//
//  Created by Louis Lac on 24/01/2021.
//

import SwiftUI

struct Mainview: View {
    @State private var tiles = Tile.data(revolutions: 8)
    @State private var subdivisions = 0
    @State private var _revolutions = 8.0
    @Environment(\.colorScheme) var colorScheme
    
    var revolutions: Int { Int(_revolutions) }
    
    var body: some View {
        NavigationView {
            VStack {
                PenroseView(tiles: $tiles)
                Spacer()
                sliderView
                buttonView
                Text("Total triangles: \(tiles.count)")
                    .font(.headline)
            }
            .padding()
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Penrose Pattern", displayMode: .inline)
        }
    }
    
    fileprivate var sliderView: some View {
        VStack(alignment: .leading) {
            Text("Number of Revolutions: ")
                .font(.headline)
            HStack {
                Slider(value: $_revolutions, in: 4...32, step: 2.0) { _ in
                    tiles = Tile.data(revolutions: revolutions)
                }
                .accentColor(primaryColor)
                Text("\(revolutions)")
                    .font(.headline)
            }
        }
    }
    
    fileprivate var buttonView: some View {
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
                tiles = Tile.data(revolutions: revolutions)
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
    
    var primaryColor: Color {
        switch colorScheme {
        case .light:
            return .black
        case .dark:
            return .white
        @unknown default:
            return .black
        }
    }
    
    var backgroundColor: Color {
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
            Mainview()
            Mainview()
                .environment(\.colorScheme, .dark)
        }
    }
}
