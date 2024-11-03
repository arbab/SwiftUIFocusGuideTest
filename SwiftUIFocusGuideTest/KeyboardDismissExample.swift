//
//  KeyboardDismissExample.swift
//  SwiftUIFocusGuideTest
//
//  Created by Arbab Nawaz on 11/3/24.
//
import SwiftUI

struct KeyboardDismissExample: View {
    @State private var text = ""
    
    var body: some View {
        List {
            ForEach(0..<100) { i in
                TextField(("Item \(i)"), text: .constant(""))
            }
        }
        .scrollDismissesKeyboard(.interactively)
            
    }
}
