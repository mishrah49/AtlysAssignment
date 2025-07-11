//
//  CarouselView.swift
//  Atlys
//
//  Created by Harshit Mishra on 11/07/25.
//

import SwiftUI

struct CarouselView: View {
    let items: [CarouselItem]
    
    @State private var currentIndex: Int?

    private let minScale: CGFloat = 0.8

    init(items: [CarouselItem]) {
        self.items = items
    }

    var body: some View {
        GeometryReader { containerProxy in
            let itemHeight = containerProxy.size.height * 0.9
            let itemWidth = itemHeight
            let horizontalPadding = (containerProxy.size.width - itemWidth) / 2
            let effectiveSpacing = -(itemWidth * (1.0 - minScale)/2)
            
            let pageControlBinding = Binding<Int>(
                get: { currentIndex ?? 0 },
                set: { currentIndex = $0 }
            )

            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: effectiveSpacing) {
                        ForEach(items.indices, id: \.self) { index in
                            GeometryReader { itemProxy in
                                let item = items[index]
                                let scale = calculateScale(containerProxy: containerProxy, itemProxy: itemProxy)

                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.purple.opacity(0.2))
                                    
                                    Image(systemName: item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.purple)
                                        .padding(itemWidth * 0.15)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .scaleEffect(scale)
                                .shadow(color: .black.opacity(0.15), radius: 10, y: 5)
                                .zIndex(scale)
                            }
                            .frame(width: itemWidth, height: itemHeight)
                            .id(index)
                        }
                    }
                    .scrollTargetLayout()
                    .padding(.horizontal, horizontalPadding)
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $currentIndex)
                
                PageControlView(numberOfPages: items.count, currentPage: pageControlBinding)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                currentIndex = items.count / 2
            }
            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: currentIndex)
        }
    }
    
    private func calculateScale(containerProxy: GeometryProxy, itemProxy: GeometryProxy) -> CGFloat {
        let containerMidX = containerProxy.frame(in: .global).midX
        let itemMidX = itemProxy.frame(in: .global).midX
        let distanceFromCenter = abs(containerMidX - itemMidX)
        let progress = min(1.0, distanceFromCenter / (containerProxy.size.width / 2))
        let scale = 1.0 - (progress * (1.0 - minScale))
        return max(scale, minScale)
    }
}
