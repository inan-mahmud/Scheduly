//
//  ApplicationUtility.swift
//  Scheduly
//
//  Created by cefalo on 26/11/23.
//

import Foundation
import UIKit

final class ApplicationUtility {
    static var rootViewController: UIViewController {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return .init() }
        
        
        return rootViewController
                
    }
}
