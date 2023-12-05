//
//  ThemeSaver.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 05.12.2023.
//

import Foundation

final class ThemeSaver {
    
    static func putData() {
        let theme = Theme.currentTheme.type
        UserDefaults.standard.set(theme.rawValue, forKey: "theme")
    }
    static func getData() {
        let theme = UserDefaults.standard.string(forKey: "theme")
        let themeType = AllAppTheme(rawValue: theme ?? "white")
        switch themeType {
        case .white: Theme.currentTheme = WhiteTheme()
        case .blue: Theme.currentTheme = BlueTheme()
        case .green: Theme.currentTheme = GreenTheme()
        default: Theme.currentTheme = WhiteTheme()
        }
    }
}
