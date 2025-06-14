//
//  FormOption.swift
//  MultiSelectPicker
//
//  Created by Guru King on 19/04/2025.
//

import Foundation

/// A model representing a selectable option, used in the picker
public struct FormOption: Hashable, Identifiable {
    public var id: String = UUID().uuidString
    var label: String
    var value: String?
    var uid: String?
}

