//
//  SnapSheetState.swift
//  Snap
//
//  Created by Jonas Kaiser on 14.07.23.
//

import SwiftUI

public enum SnapSheetState: Equatable {
    case hidden
    case small
    case middle
    case large
    case height(CGFloat)
}
