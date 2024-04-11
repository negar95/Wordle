//
//  KeyboardModelGenerator.swift
//  Wordle
//
//  Created by Negar Moshtaghi on 4/11/24.
//

struct KeyboardModelGenerator {

    static func generate() -> [[KeyModel]] {
        return [
            "QWERTYUIOP".keyModels,
            "ASDFGHJKL".keyModels,
            "ZXCVBNM".keyModels
        ]
    }
}

fileprivate extension String {
    var keyModels: [KeyModel] {
        map { KeyModel(character: String($0)) }
    }
}
