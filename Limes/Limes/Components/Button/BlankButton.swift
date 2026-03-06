//
//  BlankButton.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/06.
//

import SwiftUI

struct BlankButton: View {
    let buttonTitle: String
    let badge: Int?
    let icon: String
    let width: CGFloat
    let height: CGFloat
    
    var task: () async -> ()
    var onStatusChange: (Bool) -> () = { _ in }
    @State private var isLoading: Bool = false
    
    var body: some View {
//        HStack {
            Button {
                Task {
                    isLoading = true
                    await task()
                    try? await Task.sleep(for: .seconds(0.5))
                    isLoading = false
                }
            } label: {
                VStack {
                    HStack {
                        Text(buttonTitle)
                            .font(.darkerGrotesqueBold(size: 18))
                            .foregroundColor(.white)
                        Spacer()
                        if (badge != nil) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.red)
                                Text("\(String(describing: Int(badge!)))")
                                    .font(.manropeBold(size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                        if (icon == "chevron.right") {
                            Image(systemName: icon)
                                .resizable()
                                .foregroundStyle(Color.white)
                                .frame(width: 12, height: 14)
                        } else {
                            Image(systemName: icon)
                                .resizable()
                                .foregroundStyle(Color.white)
                                .frame(width: 20, height: 16)
                        }
                    }
                    if (icon == "chevron.right") {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .animation(.easeInOut(duration:0.25), value: isLoading)
            .disabled(isLoading)
            .onChange(of: isLoading) { oldValue, newValue in
                withAnimation(.easeInOut(duration: 0.25)) {
                    onStatusChange(newValue)
                }
            }
//        }
        .appBackground()
    }
}
