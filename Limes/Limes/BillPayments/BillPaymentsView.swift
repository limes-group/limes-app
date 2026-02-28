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
                        .font(.darkerGrotesque(size: 30))
                        .bold()
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                    
                    SearchEntryView(searchText: $searchText)
                    InputAmountView(inputAmount: $inputAmount)
                    InputReferenceView(inputReference: $inputReference)
                    
                    Button {
                        
                    } label: {
                        Text("Confirm")
                            .font(Font.system(.body, weight: .bold))
                            .font(.darkerGrotesque(size: 16))
                            .foregroundStyle(.black )
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(.accent)
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(16)
                    }
                    .padding()
                    
                    Spacer()
                }
                .appBackground()
            }
        }
    }
    
    struct SearchEntryView: View {
        @Binding var searchText: String
        
        var body: some View {
            VStack {
                Text("Search:")
                    .font(Font.system(.body, weight: .medium))
                    .font(.manrope(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    ZStack {
                        TextField("Search", text: $searchText, prompt: Text("Enter account name").foregroundStyle(.lightBunker))
                            .font(Font.system(.body, weight: .regular))
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
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
        }
    }
    
    struct InputAmountView: View {
        @Binding var inputAmount: String
        
        var body: some View {
            VStack {
                Text("Input Amount:")
                    .font(Font.system(.body, weight: .medium))
                    .font(.manrope(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Input Amount", text: $inputAmount, prompt: Text("Enter amount").foregroundStyle(.lightBunker))
                    .font(Font.system(.body, weight: .regular))
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
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
        }
    }
    
    struct InputReferenceView: View {
        @Binding var inputReference: String
        
        var body: some View {
            VStack {
                Text("Input @EasyPay Reference:")
                    .font(Font.system(.body, weight: .medium))
                    .font(.manrope(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Input Reference", text: $inputReference, prompt: Text("Enter account number").foregroundStyle(.lightBunker))
                    .font(Font.system(.body, weight: .regular))
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
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
    }
}

#Preview {
    BillPaymentsView()
}
