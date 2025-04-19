//
//  FormOption.swift
//  MultiSelectPicker
//
//  Created by Guru King on 19/04/2025.
//

import Foundation

/// A model representing a selectable option, used in the picker
public class FormOption: Hashable, Identifiable, Equatable {
    var label: String
    var value: String?
    var uid: String?
    public var id: String = UUID().uuidString
    var isSelected: Bool = false
    
    public static func == (lhs: FormOption, rhs: FormOption) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public init(label: String, value: String? = nil, uid:String? = nil, isSelected: Bool = false) {
        self.label = label
        self.value = value
        self.uid = uid
        self.isSelected = isSelected
    }
}
