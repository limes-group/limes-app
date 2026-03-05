//
//  TransfarView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI
import Combine

struct TransfarView: View {
    @State var availableAmount = 10000.00
    @State var cardType: String = "VISA"
    @State var cardNumber: String = "4242 4242 4242 4242"
    @State var amountEntered: Decimal = 100
    @FocusState private var isKeyboardFocused: Bool
    @State var keyboardIsPresented: Bool = false
    
    enum FocusedField {
        case int, dec
    }
    
    var amountFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.currencyCode = "ZAR"
        return formatter
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    TransferHeader(availableAmount: "R 10 000.00")
                    
                    CardInformation(cardType: cardType, cardNumber: cardNumber, amountEntered: amountEntered)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                    
                    
                    TextField("Enter Amount", value: $amountEntered, format: .currency(code: "ZAR"))
                        .font(.manrope(size: 16))
                        .foregroundStyle(Color.white)
                        .keyboardType(.decimalPad)
                        .focused($isKeyboardFocused)
                        .frame(maxHeight: 40)
                        .padding(10)
                        .background(.secondaryBunker)
                        .border(.darkBorder)
                        .cornerRadius(8)
                        
                    
                    HStack {
                        BlackButton(buttonTitle: "Request") {
                            Task {
                                
                            }
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                        
                        AccentButton(buttonTitle: "Send") {
                            Task {
                                
                            }
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                    
                    Spacer()
                    if keyboardIsPresented {
                        // Display Toolbar View
                        HStack(alignment: .center) {
                            Spacer()
                            Button {
                                // Dismiss keyboard
                                UIApplication.shared.sendAction(
                                    #selector(UIResponder.resignFirstResponder),
                                    to: nil,
                                    from: nil,
                                    for: nil
                                )
                            } label: {
                                Text("Done")
                                    .frame(width: 60, height: 38)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .border(.darkBorder)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.secondaryBunker, lineWidth: 1)
                                    )
                            }
                            .padding(.trailing)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Color.secondaryBunker)
                    }
                    
                    
                }
                .padding()
                .appBackground()
            }
        }
        .onReceive(keyboardPublisher) { presented in
            self.keyboardIsPresented = presented
        }
        .onAppear() {
            UITextField.appearance().clearButtonMode = .whileEditing
            
            cardNumber = cardNumber.replacingOccurrences(of: " ", with: "")
            cardNumber = Utilities().formatCardNumber(cardNumber.properMask())
        }
    }
    
    struct TransferHeader: View {
        var availableAmount: String
        
        var body: some View {
            VStack {
                Text("Transfer")
                    .font(.darkerGrotesqueBold(size: 36))
                    .foregroundStyle(Color(.white))
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                
                Text(availableAmount)
                    .font(.darkerGrotesqueBold(size: 36))
                    .foregroundStyle(Color(.accent))
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
        }
    }
    
    struct CardInformation: View {
        var cardType: String
        var cardNumber: String
        var amountEntered: Decimal
        
        var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .foregroundStyle(Color.accent)
                        .cornerRadius(8)
                    
                    VStack (spacing: 16) {
                        HStack {
                            Text("\(cardType)")
                                .font(.manrope(size: 15))
                                .foregroundStyle(Color(.bunker))
                            Spacer()
                            
                            Text("LimesPay Visa")
                                .font(.manrope(size: 15))
                                .foregroundStyle(Color(.bunker))
                            Spacer()
                            
                            Text("\(cardNumber)")
                                .font(.manrope(size: 12))
                                .foregroundStyle(Color(.bunker))
                                .multilineTextAlignment(.trailing)
                        }
                        
                        Text(amountEntered, format: .currency(code: "ZAR").precision(.fractionLength(2)))
                            .font(.darkerGrotesqueBold(size: 34))
                            .foregroundStyle(Color(.bunker))
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T> {
        Binding<T>(get: {
            self.wrappedValue ?? defaultValue
        }, set: {
            self.wrappedValue = $0
        })
    }
}

extension View {
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .Merge(
                NotificationCenter
                    .default
                    .publisher(for: UIResponder.keyboardWillShowNotification)
                    .map { _ in true },
                NotificationCenter
                    .default
                    .publisher(for: UIResponder.keyboardWillHideNotification)
                    .map { _ in false })
            .debounce(for: .seconds(0.1), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }}

#Preview {
    TransfarView()
}
