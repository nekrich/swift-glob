import Foundation

/// An interface to the contents of the file system.
public protocol GlobFileManagerInterface: Sendable {
  /// Performs a shallow search of the specified directory and returns URLs for the contained items.
  /// - Parameters:
  ///   - url: The URL for the directory whose contents you want to enumerate.
  ///   - keys: An array of keys that identify the file properties that you want pre-fetched for each item in the directory.
  ///       For each returned URL, the specified properties are fetched and cached in the NSURL object. For a list of keys you can specify, see Common File System Resource Keys.
  ///
  ///       If you want directory contents to have no pre-fetched file properties, pass an empty array to this parameter.
  ///       If you want directory contents to have default set of pre-fetched file properties, pass nil to this parameter.
  ///   - mask: Options for the enumeration. Because this method performs only shallow enumerations, options that prevent
  ///       descending into subdirectories or packages are not allowed; the only supported option is `skipsHiddenFiles`.
  /// - Returns: An array of `URL` objects, each of which identifies a file, directory, or symbolic link contained in url. If the directory contains no entries, this method returns an empty array.
  func contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?, options mask: FileManager.DirectoryEnumerationOptions) throws -> [URL]
}

extension FileManager: @unchecked @retroactive Sendable, GlobFileManagerInterface {}
