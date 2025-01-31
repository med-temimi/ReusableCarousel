# SwiftUI Carousel Component 🚀

A lightweight and reusable carousel component built entirely in **SwiftUI** with no third-party dependencies. Perfect for displaying dynamic content like images and text in a sleek, swipeable interface. Ideal for iOS developers looking for a simple, customizable, and native SwiftUI solution.

▶️ [Watch the Demo](https://github.com/user-attachments/assets/85415555-afab-4ab0-acd4-da5ce9903eb3)

<video width="600" controls>
  <source src="https://github.com/user-attachments/assets/85415555-afab-4ab0-acd4-da5ce9903eb3" type="video/mp4">
</video>

---

## ✨ Features
- **Pure SwiftUI**: No third-party libraries or dependencies.
- **Dynamic Content**: Display images, text, or custom views.
- **Swipeable Interface**: Smooth horizontal scrolling with gesture support.
- **Customizable**: Easily adapt the design to match your app's theme.
- **Lightweight**: Minimal codebase, optimized for performance.

---

## ⚠️ Limitations
- **No Pagination**: This carousel does not include built-in page indicators.
- **No Video Support**: Currently supports only images and text.

---

## 📥 Installation
### Manual Installation
1. Clone the repository:

   ```bash
   git clone https://github.com/med-temimi/ReusableCarousel.git
   ```
2. Drag and drop the `CarouselView.swift` and `CarouselCardView.swift` files into your Xcode project.

---

## 🛠️ Usage

### Basic Example

Import the carousel component:

```swift
import SwiftUI
```

Define your data model:

```swift
struct CardData: Identifiable {
    let id: Int
    let title: String
    let description: String
    let image: String
}
```

Load your data (e.g., from a JSON file):

```swift
let cardData: [CardData] = DataLoader.loadJSON()
```

Use the `CarouselView` in your SwiftUI view:

```swift
struct ContentView: View {
    var body: some View {
        CarouselView(data: cardData) { card in
            VStack {
                AsyncImage(url: URL(string: card.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("Failed to load image")
                    } else {
                        ProgressView()
                    }
                }
                .frame(height: 200)
                
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(card.description)
                    .font(.body)
                    .lineLimit(3)
            }
            .padding()
        }
    }
}
```

---

## 🎨 Customization

### Custom Card View

You can customize the appearance of each card by modifying the `CardView` component:

```swift
struct CardView: View {
    let card: CardData
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card.image)) { phase in
                // Custom image handling
            }
            .frame(height: 200)
            
            Text(card.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(card.description)
                .font(.body)
                .lineLimit(3)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
```

### Custom Carousel Behavior

Modify the `CarouselView` to adjust swipe sensitivity, animation speed, or other behaviors:

```swift
struct CarouselView<Content: View, T: Identifiable>: View {
    let data: [T]
    let content: (T) -> Content
    
    var body: some View {
        TabView {
            ForEach(data) { item in
                content(item)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
```

---

## 🎥 Preview

### Carousel Demo
Stay tuned for an upcoming demo showcasing the carousel in action!

<img src="https://github.com/user-attachments/assets/280d2c81-2623-4c63-878d-36874ef928e8">

<img src="https://github.com/user-attachments/assets/4e868ecd-d785-49fb-883a-3ccc1387a3e3">

<img src="https://github.com/user-attachments/assets/79f84a29-3da1-4059-adfb-63cf498326ff">
<img src="https://github.com/user-attachments/assets/cbdb5591-a77b-479f-8938-b749c4911e8a">

---

## 🤝 Contributing

Contributions are welcome! If you'd like to improve this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes.
4. Submit a pull request.

---

## 🙏 Acknowledgments

- Built with ❤️ using SwiftUI.
- Inspired by the need for a simple, reusable SwiftUI components.

---
