//
//  PaymentRepository.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation
import Combine

class PaymentRepository: ObservableObject {
 
    func initializePaymentWith(id productId: String, msisdn: String = "") {
        
    }
    
    func verifyPaymentWith(reference: String, saveCard: Bool = false) {
        
    }
    
    // orderId: Order ID returned from order creation
    func linkTransaction(transactionReference: String, orderId: Int) {
        
    }
    
    func getSavedCards() {
        
    }
    
    func chargeSavedCard(paymentMethodId: UUID, amount: Decimal) {
        
    }
    
    func deleteSavedCard(paymentMethodId: UUID) {
        
    }
    
    func getAllUserSubscriptions() {
        
    }
    
    func cancelSubscription(productId: String, msisdn: String) {
        
    }
    
    func getUserTransactions(limit: Int?) {
        
    }
    
    enum ServiceCode {
        case voice
        case data
        case sms
        case whatsApp
        case gpa_credit
    }
    
    func initializeDynamicServicesPayment(msisdn: String, services: [String], servicesValue: [Decimal], definitionCode: [ServiceCode], expiryDate: [Date], priceInCents: [Int]) {
        
    }
    
    func subscribeToDynamicServices(msisdn: String, paymentMethodId: UUID, services: [String], servicesValue: [Decimal], definitionCode: [ServiceCode], expiryDate: [Date], priceInCents: [Int]) {
        
    }
    
    func initializeComboBundlePayment(productId: String, msisdn: String, amount: Decimal) {
        
    }
    
    func subscribeToComboBundle(productId: String, msisdn: String, paymentMethodId: UUID, amount: Decimal) {
        
    }
    
    func refundTransaction(transactionReference: String, amountInCents: Decimal?, reason: String) {
        
    }
}
