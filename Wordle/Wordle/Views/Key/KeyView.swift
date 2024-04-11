//
//  KeyView.swift
//  Wordle
//
//  Created by Negar Moshtaghi on 4/2/24.
//

import SwiftUI

struct KeyView: View {
    let model: KeyModel
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .foregroundStyle(Color.gray)
                .shadow(color: .gray, radius: 10)
            Text(String(model.character))
                .font(.caption)
                .bold()
                .foregroundStyle(Color.white)
        }
        .frame(width: 30, height: 30)
        .padding(0)
    }
}

#Preview {
    KeyView(model: KeyModel(character: "s"))
}
