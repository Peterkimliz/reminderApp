//
//  String+Extensions.swift
//  Reminders
//
//  Created by Apple on 30/09/2026.
//

import SwiftUI

extension String{
    
    var isWhiteSpaceOrEmpty:Bool{
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
