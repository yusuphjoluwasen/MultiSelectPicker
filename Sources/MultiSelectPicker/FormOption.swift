//
//  FormOption.swift
//  MultiSelectPicker
//
//  Created by Guru King on 19/04/2025.
//

import Foundation

/// A model representing a selectable option, used in the picker
public struct FormOption: Hashable, Identifiable {
    public var id: String
    public var label: String
    public var value: String
    
    public init(id: String = UUID().uuidString, label: String, value: String) {
        self.id = id
        self.label = label
        self.value = value
    }
}

