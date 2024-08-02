//
//  ViewExtension.swift
//  PainT
//
//  Created by 최승희 on 8/1/24.
//

import SwiftUI

// 출처 https://green1229.tistory.com/298
extension View {
    @ViewBuilder public func overlayIf<T: View>(
        _ condition: Bool,
        _ content: T,
        alignment: Alignment = .center
    ) -> some View {
        if condition {
            self.overlay(content, alignment: alignment)
        } else {
            self
        }
    }
}
