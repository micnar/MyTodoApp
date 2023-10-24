//
//  TAButton.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import SwiftUI

struct TAButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TAButton(title: "Value", background: .pink) {
        
    }
}
