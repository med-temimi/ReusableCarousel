//
//  DataLoader.swift
//  Carousel
//
//  Created by Macbook Pro  M'ed on 30/01/25.
//


import Foundation

class DataLoader {
    static func loadJSON() -> [CarouselCard] {
        // Get the URL of the JSON file
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("Failed to locate data.json in bundle.")
            return []
        }
        
        // Load the data from the file
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load data from JSON file.")
            return []
        }
        
        // Decode the JSON data into an array of CardData objects
        let decoder = JSONDecoder()
        guard let cardData = try? decoder.decode([CarouselCard].self, from: data) else {
            print("Failed to decode JSON data.")
            return []
        }
        
        return cardData
    }
}
