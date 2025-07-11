//
//  PageControlView.swift
//  Atlys
//
//  Created by Harshit Mishra on 11/07/25.
//
import SwiftUI

struct PageControlView: View {
    let numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.primary : Color.gray.opacity(0.4))
                    .frame(width: 8, height: 8)
                    .scaleEffect(index == currentPage ? 1.2 : 1.0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5), value: currentPage)
            }
        }
    }
}
