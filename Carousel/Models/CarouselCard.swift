//
//  CarouselCard.swift
//  Carousel
//
//  Created by Macbook Pro  M'ed on 30/01/25.
//

import Foundation

struct CarouselCard: Identifiable, Codable {
    let id: Int
    let title: String
    let bio: String
    let description: String
    let index: Int
    let image: String
}
