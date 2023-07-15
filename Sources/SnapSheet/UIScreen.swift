//
//  File.swift
//  
//
//  Created by Jonas Kaiser on 15.07.23.
//

import SwiftUI

extension UIScreen {
    static var bottomSafeArea: CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        return (keyWindow?.safeAreaInsets.bottom) ?? 0
    }
}
