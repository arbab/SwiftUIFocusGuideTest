//
//  ContentView.swift
//  SwiftUIFocusGuideTest
//
//  Created by Arbab Nawaz on 11/3/24.
//

import SwiftUI
import Observation

struct CustomFocusKey: EnvironmentKey {
    static let defaultValue = true
}

extension EnvironmentValues {
    var customFocus: Bool {
        get { self[CustomFocusKey.self] }
        set { self[CustomFocusKey.self] = newValue }
    }
    
    @Entry var myCustomValue: String = "Custom Default value"
}

struct MyButtonStyle: ButtonStyle {
    @Environment(\.customFocus) var focus
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(focus ? .red : .blue)
            .scaleEffect(focus ? 1.5 : 1)
    }
}

struct CustomFocusModifier: ViewModifier {
    @FocusState var focus: Bool
    
    func body(content: Content) -> some View {
        content
            .focused($focus)
            .environment(\.customFocus, focus)
    }
}

extension View {
    func customFocus() -> some View {
        modifier(CustomFocusModifier())
    }
    
    func myCustomValue(_ myCustomValue: String) -> some View {
        environment(\.myCustomValue, myCustomValue)
    }
}



@Observable
class DataModel {
    var count = 0
}



struct ContentView: View {
    @FocusState var focus: Bool
    @State var isFocused: Bool = false
    @Environment(\.myCustomValue) var customEnvValue
    @State var showSheet: Bool = false
    
    @State private var dataModel = DataModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            HStack(spacing: 25) {
                Button(action: {}, label: {
                    Text("Button 0")
                })
                Button("Button 1") {}
                Button("Button 2") {}
                Button("Button 3") {}
            }.customFocus()
            HStack(spacing: 35) {
                Button("Button 4") {
                    print(customEnvValue)
                }
                Spacer()
            }.customFocus()
#if os(macOS)
                .focusSection()
#endif
            HStack(spacing: 35) {
                Button("Button 5") { showSheet.toggle() }
                Text("Count: \(dataModel.count)")
                IncrementButton(dataModel: dataModel)
            }
        }
        .buttonStyle(MyButtonStyle())
        .fixedSize()
        .padding()
        .sheet(isPresented: $showSheet) {
            Text("Form Sheet")
                .font(.title)
                .presentationSizing(.form)
        }
    }
}

struct IncrementButton: View {
    var dataModel: DataModel
    
    var body: some View {
        Button("Increment") {
            dataModel.count += 1
        }
    }
}

#Preview {
    ContentView()
}


