//
//  CarouselView.swift
//  Carousel
//
//  Created by Macbook Pro  M'ed on 30/01/25.
//

import SwiftUI

struct CarouselView: View {
    let cards: [CarouselCard]
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let cornerRadius: CGFloat
    let shadowRadius: CGFloat
    let isHorizontalScroll: Bool

    var body: some View {
        ScrollView(isHorizontalScroll ? .horizontal : .vertical, showsIndicators: false) {
            Group {
                if isHorizontalScroll {
                    HStack(spacing: 10) {
                        cardViews
                    }
                } else {
                    VStack(spacing: 10) {
                        cardViews
                    }
                }
            }
            .padding()
        }
    }

    // Reusable card views
    @ViewBuilder
    private var cardViews: some View {
        ForEach(cards) { card in
            GeometryReader { geometry in
                CarouselCardView(
                    card: card,
                    cardWidth: cardWidth,
                    cardHeight: cardHeight,
                    cornerRadius: cornerRadius,
                    shadowRadius: shadowRadius
                )
                .scaleEffect(scaleValue(for: geometry))
                .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0), value: scaleValue(for: geometry))
            }
            .frame(width: cardWidth, height: cardHeight)
        }
    }

    // Calculate the scale effect based on the card's position
    private func scaleValue(for geometry: GeometryProxy) -> CGFloat {
        if isHorizontalScroll {
            let midX = geometry.frame(in: .global).midX
            let screenMidX = UIScreen.main.bounds.width / 2
            let distance = abs(midX - screenMidX)
            let maxDistance = UIScreen.main.bounds.width / 2
            return max(1 - (distance / maxDistance) * 0.2, 0.8)
        } else {
            let midY = geometry.frame(in: .global).midY
            let screenMidY = UIScreen.main.bounds.height / 2
            let distance = abs(midY - screenMidY)
            let maxDistance = UIScreen.main.bounds.height / 2
            return max(1 - (distance / maxDistance) * 0.2, 0.8)
        }
    }
}
