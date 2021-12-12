//
//  FileConfig.swift
//  ConfigProject
//
//  Created by T.Minh on 10/6/21.
//

import Foundation

/// It will help you get some values more secrectly by environments config.
final class AppConfiguration {

    /// Get the value according to the given key in your bundle
    ///
    /// - Parameter key: The keys that you defined in .xcconfig file
    /// - Returns: The accordingly value
    static func infoForKey(_ key: String) -> String? {
        guard let configs = Bundle.main.infoDictionary?["App Configurations"] as? [String: String],
            let value = configs[key] else { return nil }
        return value.replacingOccurrences(of: "\\", with: "")
    }

    /// Get the value according to the given key in your bundle
    ///
    /// - Parameter key: The keys that you defined `AppConfigurationKeys`
    /// - Returns: The accordingly value
    static func infoForKey(_ key: AppConfigurationKeys) -> String? {
        guard let configs = Bundle.main.infoDictionary?["App Configurations"] as? [String: String],
            let value = configs[key.rawValue] else { return nil }
        return value.replacingOccurrences(of: "\\", with: "")
    }
}

/// Define some keys that using in .xcconfig file. It help you less confused and get correctly values
///
/// - displayName: The app name
/// - baseURL: The base url to request API

enum AppConfigurationKeys: String {
    // Application
    case displayName = "DISPLAY_NAME"
    case bundleIndentifier = "BUNDLE_INDENTIFIER"
    case baseURL = "BASE_URL"
//
//    // BASE 2
//    case baseURL2 = "BASE_URL2"
//
//    // Webview
//    case webviewBaseURL = "WEBVIEW_BASE_URL"
//
//    // Encryption Key
//    case encryptionKey = "ENCRYPTION_KEY"
//
//    // Basic authen username
//    case basicAuthenUserName = "BASIC_AUTHEN_USER_NAME"
//
//    // Basic authen password
//    case basicAuthenPassword = "BASIC_AUTHEN_PASSWORD"
//
//    // Adobe Analytics
//    case adobeAppID = "ADOBE_APP_ID"
//
//    // AppsFlyer
//    case appsFlyerDevKey = "APPSFLYER_DEV_KEY"
//    case appsFlyerAppleAppID = "APPSFLYER_APPLE_APP_ID"
//
//    // Enable send webview basic authentication
//    case enableSendWebViewBasicAuthentication = "ENABLE_SEND_WEBVIEW_BASIC_AUTHENTICATION"
//
//    // Current enviroment
//    case isProductEnviroment = "IS_PRODUCT_ENVIROMENT"
}
