//
//  ContentView.swift
//  Atlys
//
//  Created by Harshit Mishra on 11/07/25.
//

import SwiftUI

//Example data for Carousel
private let sampleItems: [CarouselItem] = [
    .init(imageName: "airplane.circle.fill"),
    .init(imageName: "tram.fill"),
    .init(imageName: "sailboat.fill"),
    .init(imageName: "car.fill"),
    .init(imageName: "bicycle"),
    .init(imageName: "figure.walk.circle.fill"),
]


struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            //Atlys Logo
            VStack {
                Text("atlys")
                    .font(.system(size: 40, weight: .bold))
                Text("visas on time")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 20)
            
            //Main Carousel
            CarouselView(items: sampleItems)
                .frame(height: 350)
            
            //Login Options
            
            VStack(spacing: 24) {
                Text("Get Visas\n On Time")
                    .font(.title)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Button("Continue") {}
                    .buttonStyle(.borderedProminent)
                    .tint(.purple.opacity(0.8))
                    .controlSize(.large)
                    .frame(maxWidth: .infinity)
                
                Text("or")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                HStack(spacing: 20) {
                    Image(systemName: "g.circle.fill").font(.largeTitle).foregroundStyle(.gray.opacity(0.5))
                    Image(systemName: "apple.logo").font(.largeTitle)
                    Image(systemName: "envelope.fill").font(.largeTitle).foregroundStyle(.gray.opacity(0.5))
                }
            }
            .padding(30)
            
            Spacer()
        }
        .padding(.top)
    }
}

// MARK: Preview

#Preview {
    ContentView()
}
