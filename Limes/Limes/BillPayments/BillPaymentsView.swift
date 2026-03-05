//
//  BillPaymentsView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct BillPaymentsView: View {
    @State var searchText: String = ""
    @State var inputAmount: String = ""
    @State var inputReference: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Bill payments")
                        .font(.darkerGrotesqueBold(size: 30))
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                    
                    SearchEntryView(searchText: $searchText)
                    
                    InputAmountView(labelValue: "Input amount:", placeholder: "Enter amount", inputAmount: $inputAmount)
                    
                    InputReferenceView(inputReference: $inputReference)
                    
                    AccentButton(buttonTitle: "Confirm") {
                        Task {
                            
                        }
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                    
                    Spacer()
                }
                .padding()
                .appBackground()
            }
        }
    }
    
    struct SearchEntryView: View {
        @Binding var searchText: String
        
        var body: some View {
            VStack {
                Text("Search:")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    ZStack {
                        TextField("Search", text: $searchText, prompt: Text("Enter account name").foregroundStyle(.lightBunker))
                            .font(.manrope(size: 16))
                            .foregroundStyle(Color.white)
                            .keyboardType(.emailAddress)
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                        
                        Spacer()
                        
                        Button(action: { }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.lightBunker)
                        }
                        .padding(8)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
        }
    }
    
    struct InputReferenceView: View {
        @Binding var inputReference: String
        
        var body: some View {
            VStack {
                Text("Input @EasyPay Reference:")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Input Reference", text: $inputReference, prompt: Text("Enter account number").foregroundStyle(.lightBunker))
                    .font(.manrope(size: 16))
                    .foregroundStyle(Color.white)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    .background(.secondaryBunker)
                    .border(.darkBorder)
                    .cornerRadius(8)
                    .shadow(radius: 1)
            }
        }
    }
}

#Preview {
    BillPaymentsView()
}
