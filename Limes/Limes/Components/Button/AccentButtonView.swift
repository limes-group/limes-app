//
//  AccentButtonView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct AccentButtonView: View {
    let buttonTitle: String
    let width: CGFloat
    let height: CGFloat
    
    var task: () async -> ()
    var onStatusChange: (Bool) -> () = { _ in }
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Button {
                Task {
                    isLoading = true
                    await task()
                    try? await Task.sleep(for: .seconds(0.5))
                    isLoading = false
                }
            } label: {
                Text(buttonTitle)
                    .font(.darkerGrotesqueBold(size: 24))
                    .foregroundStyle(.black )
                    .frame(maxWidth: width, maxHeight: height)
                    .background(.accent)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(16)
                    .lineLimit(nil)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .opacity(isLoading ? 0 : 1)
                    .overlay {
                        ProgressView()
                            .opacity(isLoading ? 1 : 0)
                    }
            }
            .animation(.easeInOut(duration:0.25), value: isLoading)
            .disabled(isLoading)
            .onChange(of: isLoading) { oldValue, newValue in
                withAnimation(.easeInOut(duration: 0.25)) {
                    onStatusChange(newValue)
                }
            }
        }
        .appBackground()
    }
}

#Preview {
    AccentButtonView(buttonTitle: "Continue", width: .infinity, height: 48, task: {})
}
