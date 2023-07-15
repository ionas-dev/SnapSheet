//
//  SnapSheet.swift
//  Snap
//
//  Created by Jonas Kaiser on 14.07.23.
//

import SwiftUI

public struct SnapSheet<Content: View>: View {
    @State private var innerState: SnapSheetState
    @Binding private var outerState: SnapSheetState
    private var smallHeight: CGFloat
    private var middleHeight: CGFloat
    private var largeHeight: CGFloat
    private var content: Content
    private var backgroundColor: Color = Color(UIColor.systemGray6)
        
    private var height: CGFloat {
        switch innerState {
        case .hidden: return 0
        case .small: return smallHeight
        case .middle: return middleHeight
        case .large: return largeHeight
        case .height(let y): return y
        }
    }
    
    public init(
        _ state: Binding<SnapSheetState> = .constant(.small),
        smallHeight: CGFloat = UIScreen.main.bounds.size.height * 0.1,
        middleHeight: CGFloat = UIScreen.main.bounds.size.height * 0.4,
        largeHeight: CGFloat = UIScreen.main.bounds.size.height * 0.78,
        @ViewBuilder content: () -> Content) {
        self._innerState = State(initialValue: state.wrappedValue)
        self._outerState = state
        self.smallHeight = smallHeight
        self.middleHeight = middleHeight
        self.largeHeight = largeHeight
        self.content = content()
    }
    
    private init(
        _ state: Binding<SnapSheetState>,
        smallHeight: CGFloat = UIScreen.main.bounds.size.height * 0.1,
        middleHeight: CGFloat = UIScreen.main.bounds.size.height * 0.4,
        largeHeight: CGFloat = UIScreen.main.bounds.size.height * 0.78,
        backgroundColor: Color = .gray,
        @ViewBuilder content: () -> Content) {
        self._innerState = State(initialValue: state.wrappedValue)
        self._outerState = state
        self.smallHeight = smallHeight
        self.middleHeight = middleHeight
        self.largeHeight = largeHeight
        self.content = content()
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Capsule()
                .fill(Color(UIColor.systemGray4))
                .frame(width: 40, height: 5)
                .padding(.vertical, 10.0)
            
            content
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.size.width, height: height, alignment: .bottom)
        .background(
            RoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                .fill(backgroundColor)
                .edgesIgnoringSafeArea(.bottom)
                .shadow(radius: 3)
        )
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    innerState = .height(min(max(height - gesture.translation.height, smallHeight), UIScreen.main.bounds.size.height))
                }
                .onEnded { gesture in
                    let predictedHeight = height - gesture.predictedEndTranslation.height
                    withAnimation(.spring()) {
                        if predictedHeight < smallHeight + (middleHeight - smallHeight) / 2 {
                            innerState = .small
                        } else if predictedHeight < middleHeight + (largeHeight - middleHeight) / 2 {
                            innerState = .middle
                        } else {
                            innerState = .large
                        }
                    }
                    outerState = innerState
                }
        )
        .onChange(of: outerState) { _ in
            withAnimation(.spring()) {
                innerState = outerState
            }
        }
    }
    
    public func background(_ color: Color) -> some View {
        return SnapSheet(_outerState, smallHeight: smallHeight, middleHeight: middleHeight, largeHeight: largeHeight, backgroundColor: color) {
            content
        }
    }
}
