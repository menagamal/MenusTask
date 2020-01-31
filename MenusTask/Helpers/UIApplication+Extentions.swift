//
//  UIApplication+Extentions.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation


import UIKit

extension UIApplication {
    /// The app's key window taking into consideration apps that support multiple scenes.
    var keyWindowInConnectedScenes: UIWindow? {
        if #available(iOS 13.0, *) {
            let keyWindow = connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            keyWindow?.backgroundColor = .white
            return keyWindow
        } else {
            // Fallback on earlier versions
            keyWindow?.backgroundColor = .white
            return keyWindow
        }
    }
    
    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            //38482458385 Long
                   let tag = 1024
                   if let statusBar = keyWindow?.viewWithTag(tag) {
                       return statusBar
                   } else {
                       let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                       statusBarView.tag = tag
                       keyWindow?.addSubview(statusBarView)
                       return statusBarView
                   }
               } else if responds(to: Selector(("statusBar"))) {
                   return value(forKey: "statusBar") as? UIView
               } else {
                   return nil
        }
    }
}
