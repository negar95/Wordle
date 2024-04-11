//
//  ContentView.swift
//  Wordle
//
//  Created by Negar Moshtaghi on 2/1/24.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

struct ContentView: View {

    @State var keyboardModels: [[KeyModel]]
    @State var word: [KeyModel]

    init(word: String) {
        self.keyboardModels = KeyboardModelGenerator.generate()
        self.word = word.map { _ in KeyModel(character: "") }
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(word) { model in
                    KeyView(model: model)
                        .onDrop(of: [.plainText], isTargeted: nil) { providers, location in
                            providers.first?.loadDataRepresentation(forTypeIdentifier: UTType.plainText.identifier) { data, error in
                                if let data = data, let content = String(data: data, encoding: .utf8) {
                                    if let index = word.firstIndex(where: {$0.id == model.id}) {
                                        word[index].character = content
                                    }
                                }
                            }
                            return true
                        }
                }
            }
            Spacer()
            VStack {
                ForEach(keyboardModels, id: \.self) { row in
                    HStack {
                        ForEach(row) { model in
                            KeyView(model: model)
                                .onDrag {
                                    return NSItemProvider(object: String(model.character) as NSString)
                                }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}
