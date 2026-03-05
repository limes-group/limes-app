//
//  EFTPaymentView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI
import Contacts

struct Contact: Identifiable, Equatable {
    var id = UUID()
    var fullName: String
    var phoneNumber: String
}

struct EFTPaymentView: View {
    @State var inputAmount = ""
    @State var pinNumber = ""
    @State var phoneContacts: [Contact] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("EFT")
                        .font(.darkerGrotesqueBold(size: 30))
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                    
                    if phoneContacts != [] {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 8) {
                                ForEach(0..<phoneContacts.count) { index in
                                    VStack {
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .foregroundStyle(Color(.white))
                                            .frame(width: 50, height: 50)
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                            .animation(.linear, value: 3)
                                        
                                        Text("\(phoneContacts[index].fullName)")
                                            .font(.footnote)
                                            .foregroundStyle(.lightBunker)
                                        Text("\(phoneContacts[index].phoneNumber)")
                                            .font(.body)
                                            .foregroundStyle(.lightBunker)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: 140)
                                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.secondaryBunker, lineWidth: 1)
                                    )
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 180)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    }
                    
                    InputAmountView(labelValue: "Input amount:", placeholder: "Enter amount", inputAmount: $inputAmount)
                    
                    PinNumberFieldView(labelValue: "Pin:", pinNumber: $pinNumber, titleKey: "Create Pin")
                    
                    AccentButton(buttonTitle: "Confirm", height: 60) {
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
        .task {
            do {
                try await getContactList()
            } catch {
                print("Failed to fetch data: \(error)")
            }
        }
    }
    
    func getContactList() async throws {
        let contactStore = CNContactStore()
        
        let keysToFetch = [
            CNContactGivenNameKey,
            CNContactFamilyNameKey,
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactImageDataKey, // For contact photos
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName) // For full name formatting
        ] as! [CNKeyDescriptor]
        
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            do {
                let request = CNContactFetchRequest(keysToFetch: keysToFetch)
                
                try contactStore.enumerateContacts(with: request) { (contact, error) in
                    let fullName = CNContactFormatter.string(from: contact, style: .fullName)
                    if let phoneNumber = contact.phoneNumbers.first?.value {
                        print("Contact: \(fullName ?? "No Name"), Phone: \(phoneNumber.stringValue)")
                        phoneContacts.append(Contact(fullName: fullName ?? "No Name", phoneNumber: phoneNumber.stringValue))
                    }
                }
            } catch {
                print("Error fetching contacts")
            }
        case .denied:
            print("Access denied.")
        case .notDetermined:
            contactStore.requestAccess(for: .contacts) { (success, error) in
                if success {
                    Task {
                        do {
                            try await getContactList()
                        } catch {
                            print("Failed to fetch data: \(error)")
                        }
                    }
                } else {
                    print("Error requesting access")
                }
            }
        case .restricted:
            print("Access to contacts is restricted")
        default:
            print("Could not retrieve contacts.")
        }
    }
}

#Preview {
    EFTPaymentView()
}
