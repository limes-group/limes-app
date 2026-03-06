//
//  TaskButtonView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/06.
//

import SwiftUI

struct TaskButtonView: View {
    var buttonTitle: String
    var task: () async -> ()
    var onStatusChange: (Bool) -> () = { _ in }
    @State private var isLoading: Bool = false
    
    var body: some View {
        Button {
            Task {
                isLoading = true
                await task()
                try? await Task.sleep(for: .seconds(0.5))
                isLoading = false
            }
        } label: {
            Text(buttonTitle)
                .font(.darkerGrotesqueBold(size: 16))
                .foregroundStyle(.black )
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(.accent)
                .buttonStyle(.borderedProminent)
                .cornerRadius(16)
                .lineLimit(nil)
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
}

#Preview {
    TaskButtonView(buttonTitle: "Login", task: {})
}
