//
//  LinkCardView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/26.
//

import SwiftUI

enum CardType {
    case cardtype_visa, cardtype_masterCardc, other
    
    var displayName: String {
        switch self {
        case .cardtype_visa: return "Visa"
        case .cardtype_masterCardc: return "Maseter Card"
        case .other: return "Other"
        }
    }
}

struct LinkCardView: View {
    @State var cardType = "" // : String = CardType.cardtype_visa.displayName
    @State var cardName = ""
    @State var cardNumber = ""
    @State var expiryDate = ""
    @State var cvv = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Link card")
                        .font(.darkerGrotesqueBold(size: 36))
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                    
                    CardDetailView(cardTypeString: $cardType, cardName: $cardName, cardNumber: $cardNumber, expiryDate: $expiryDate, cvv: $cvv)
                    
                    AccentButton(buttonTitle: "Continue") {
                        Task {
                            
                        }
                    }
                    .padding()
                    .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    
                    Spacer()
                }
            }
            .appBackground()
        }
    }
    
    struct CardDetailView: View {
        @Binding var cardTypeString: String
        @Binding var cardName: String
        @Binding var cardNumber: String
        @Binding var expiryDate: String
        @Binding var cvv: String
        
        var dropDownItem: [String] = ["Visa", "Master Card", "Other"]
        
        var body: some View {
            VStack (spacing: 8) {
                Text("Card type")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ZStack {
                        TextField("Enter Card type", text: $cardTypeString, prompt: Text("Enter card type").foregroundStyle(.lightBunker))
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .tint(.white)
                            .foregroundStyle(.red)
                            .keyboardType(.emailAddress)
                            .frame(maxHeight: 40)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                        Menu {
                            ForEach(dropDownItem, id: \.self) { item in
                                Button(item) {
                                    self.cardTypeString = item
                                }
                            }
                        } label: {
                            VStack(spacing: 5) {
                                Image(systemName: "chevron.down")
                                    .font(Font.system(.body, weight: .regular))
                            }
                        }
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                        .foregroundStyle(.lightBunker)
                    }
                    
                    
                }
                
                Text("Card name")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Enter card name", text: .constant(""), prompt: Text("Enter card name").foregroundStyle(.lightBunker))
                    .font(Font.system(.body, weight: .regular))
                    .font(.manrope(size: 16))
                    .foregroundStyle(Color.white)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    .background(.secondaryBunker)
                    .border(.darkBorder)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                
                Text("Card number")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Enter card number", text: $cardNumber, prompt: Text("Enter card number").foregroundStyle(.lightBunker))
                    .font(Font.system(.body, weight: .regular))
                    .font(.manrope(size: 16))
                    .foregroundStyle(Color.white)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    .background(.secondaryBunker)
                    .border(.darkBorder)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                
                HStack {
                    VStack {
                        Text("Expiry date")
                            .font(.manropeMedium(size: 14))
                            .foregroundStyle(Color(.white))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("mm/yy", text: $expiryDate, prompt: Text("mm/yy").foregroundStyle(.lightBunker))
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .foregroundStyle(Color.white)
                            .keyboardType(.emailAddress)
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                    }
                    Spacer()
                    VStack {
                        Text("CVV")
                            .font(.manropeMedium(size: 14))
                            .foregroundStyle(Color(.white))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter CVV", text: $cvv, prompt: Text("Enter CVV").foregroundStyle(.lightBunker))
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .foregroundStyle(Color.white)
                            .keyboardType(.emailAddress)
                            .frame(maxHeight: 40)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            .padding()
        }
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
}

#Preview {
    LinkCardView()
}
