//
//  KeyModel.swift
//  Wordle
//
//  Created by Negar Moshtaghi on 4/11/24.
//

import Foundation

struct KeyModel: Identifiable, Hashable {
    let id = UUID()
    var character: String
}
