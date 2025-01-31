//
//  CarouselCardView.swift
//  Carousel
//
//  Created by Macbook Pro  M'ed on 30/01/25.
//

import SwiftUI

struct CarouselCardView: View {
    let card: CarouselCard
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let cornerRadius: CGFloat
    let shadowRadius: CGFloat

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: card.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardWidth, height: cardHeight)
                        .clipped()
                        .cornerRadius(cornerRadius)
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                                .cornerRadius(cornerRadius)
                        )
                        .shadow(radius: shadowRadius)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardWidth, height: cardHeight)
                        .clipped()
                        .cornerRadius(cornerRadius)
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                                .cornerRadius(cornerRadius)
                        )
                        .shadow(radius: shadowRadius)
                @unknown default:
                    EmptyView()
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(card.bio)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .frame(width: cardWidth, height: cardHeight)
    }
}
