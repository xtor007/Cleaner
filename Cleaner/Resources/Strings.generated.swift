// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum ActionElements {
    /// All 
    /// Photos
    internal static let allPhotos = Strings.tr("Localizable", "actionElements.allPhotos", fallback: "All \nPhotos")
    /// All 
    /// Videos
    internal static let allVideos = Strings.tr("Localizable", "actionElements.allVideos", fallback: "All \nVideos")
    /// contacts
    internal static let contacts = Strings.tr("Localizable", "actionElements.contacts", fallback: "contacts")
    /// duplicate
    internal static let duplicates = Strings.tr("Localizable", "actionElements.duplicates", fallback: "duplicate")
    /// Duplicate contacts
    internal static let duplicatesContacts = Strings.tr("Localizable", "actionElements.duplicatesContacts", fallback: "Duplicate contacts")
    /// Duplicates photos
    internal static let duplicatesPhotos = Strings.tr("Localizable", "actionElements.duplicatesPhotos", fallback: "Duplicates photos")
    /// Duplicate screenshots
    internal static let duplicatesScreen = Strings.tr("Localizable", "actionElements.duplicatesScreen", fallback: "Duplicate screenshots")
    /// files
    internal static let files = Strings.tr("Localizable", "actionElements.files", fallback: "files")
    /// Secret 
    /// Storage
    internal static let secretStorage = Strings.tr("Localizable", "actionElements.secretStorage", fallback: "Secret \nStorage")
  }
  internal enum Cleaner {
    /// Localizable.strings
    ///   Cleaner
    /// 
    ///   Created by Anatoliy Khramchenko on 31.03.2023.
    internal static let title = Strings.tr("Localizable", "cleaner.title", fallback: "Cleaner")
  }
  internal enum YourStorage {
    /// Available:
    internal static let available = Strings.tr("Localizable", "yourStorage.available", fallback: "Available:")
    /// Your Storage
    internal static let title = Strings.tr("Localizable", "yourStorage.title", fallback: "Your Storage")
    /// Total memory:
    internal static let totalMemory = Strings.tr("Localizable", "yourStorage.totalMemory", fallback: "Total memory:")
    /// Trash size:
    internal static let trashSize = Strings.tr("Localizable", "yourStorage.trashSize", fallback: "Trash size:")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
