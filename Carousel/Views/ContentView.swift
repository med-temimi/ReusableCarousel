//
//  ContentView.swift
//  Carousel
//
//  Created by Macbook Pro  M'ed on 30/01/25.
//

import SwiftUI

struct ContentView: View {

    @State private var isHorizontalScroll: Bool = true

    let cards: [CarouselCard] = DataLoader.loadJSON()


    var body: some View {
        ScrollView {

            Picker("Scroll Direction", selection: $isHorizontalScroll) {
                Text("Horizontal").tag(true)
                Text("Vertical").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            CarouselView(
                cards: cards,
                cardWidth: 350,
                cardHeight: 250,
                cornerRadius: 20,
                shadowRadius: 10,
                isHorizontalScroll: isHorizontalScroll
            )
            .padding(.vertical)

        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
