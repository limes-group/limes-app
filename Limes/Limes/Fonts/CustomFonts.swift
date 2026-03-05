//
//  CustomFonts.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/01.
//

import SwiftUI

extension Font {
    static func manrope(size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        return .custom("Manrope-Regular", size: size, relativeTo: style)
    }
    
    static func manropeMedium(size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        return .custom("Manrope-Medium", size: size, relativeTo: style)
    }
    
    static func manropeBold(size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        return .custom("Manrope-Bold", size: size, relativeTo: style)
    }
    
    static func darkerGrotesque(size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        return .custom("DarkerGrotesque-Regular", size: size, relativeTo: style)
    }
    
    static func darkerGrotesqueBold(size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        return .custom("DarkerGrotesque-Bold", size: size, relativeTo: style)
    }
}
