//
//  LimesPackagesView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct LimesPackagesView: View {
    let packages = [
        LimesPackage(title: "Limes29", price: 29.00,
                     limesPackage: [
                        LimesPackageDetails(title: "Zero rate (90 days)", data: "1GB"),
                        LimesPackageDetails(title: "Airtime (30 days)", data: "R35"),
                     ]),
        LimesPackage(title: "Limes69", price: 69.00,
                     limesPackage: [
                        LimesPackageDetails(title: "Zero rate (90 days)", data: "1GB"),
                        LimesPackageDetails(title: "Airtime (30 days)", data: "R60"),
                        LimesPackageDetails(title: "WhatsApp (30 days)", data: "200MB"),
                     ]),
        LimesPackage(title: "Limes120", price: 120.00,
                     limesPackage: [
                        LimesPackageDetails(title: "Zero rate (90 days)", data: "2GB"),
                        LimesPackageDetails(title: "Airtime (30 days)", data: "R90"),
                        LimesPackageDetails(title: "WhatsApp (30 days)", data: "400MB"),
                     ]),
        LimesPackage(title: "Limes250", price: 250.00,
                     limesPackage: [
                        LimesPackageDetails(title: "Zero rate (90 days)", data: "6GB"),
                        LimesPackageDetails(title: "Airtime (60 days)", data: "R120"),
                        LimesPackageDetails(title: "WhatsApp (60 days)", data: "600MB"),
                     ]),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Limes packages")
                        .font(.darkerGrotesque(size: 30))
                        .bold()
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                    
                    ScrollView {
                        ForEach(0..<packages.count, id: \.self) { key in
                            let package = packages[key]
                            LimesPackagedetailView(detailPackage: package)
                        }
                    }
                    
                    Spacer()
                }
                .appBackground()
            }
        }
    }
    
    struct LimesPackagedetailView: View {
        var detailPackage: LimesPackage
        
        
        var body: some View {
            NavigationStack {
                ZStack {
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                .background(Color.secondaryBunker)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.secondaryBunker, lineWidth: 1)
                                )
                            
                            VStack (alignment: .leading) {
                                Text(detailPackage.title)
                                    .font(.darkerGrotesque(size: 16))
                                    .bold()
                                    .foregroundStyle(Color(.white))
                                
                                Rectangle()
                                    .foregroundStyle(Color(.white))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                                
                                ForEach(detailPackage.limesPackage.indices, id: \.self) { index in
                                    let package = detailPackage.limesPackage[index]
                                    
                                    HStack {
                                        Text(package.title)
                                            .font(.darkerGrotesque(size: 16))
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundStyle(Color(.white))
                                            .frame(maxWidth: .infinity)
                                        
                                        Spacer()
                                        
                                        Text(package.data)
                                            .font(.darkerGrotesque(size: 16))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .multilineTextAlignment(.leading)
                                            .frame(alignment: .trailing)
                                    }
                                }
                                
                                Text(detailPackage.price, format: .currency(code: "ZAR"))
                                    .font(.darkerGrotesque(size: 24))
                                    .bold()
                                    .foregroundStyle(.accent)
                                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                                
                                Button {
                                    
                                } label: {
                                    Text("Buy now")
                                        .font(Font.system(.body, weight: .bold))
                                        .font(.darkerGrotesque(size: 16))
                                        .foregroundStyle(.black )
                                        .frame(height: 40)
                                        .frame(maxWidth: .infinity)
                                        .background(.accent)
                                        .buttonStyle(.borderedProminent)
                                        .cornerRadius(16)
                                }
                            }
                            .padding()
                        }
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        .frame(maxHeight: 300)
                    }
                }
            }
        }
    }
}

#Preview {
    LimesPackagesView()
}
