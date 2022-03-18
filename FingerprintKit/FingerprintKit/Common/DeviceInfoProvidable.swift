//
//  DeviceInfoProvidable.swift
//  FingerprintKit
//
//  Created by Petr Palata on 13.03.2022.
//

import Foundation

public enum DeviceInfoValueType {
    case category
    case info(String)
}

public struct DeviceInfoItem {
    public let label: String
    public let value: DeviceInfoValueType
    public let children: [DeviceInfoItem]?
    
    public init(
        label: String,
        value: DeviceInfoValueType = .category,
        children: [DeviceInfoItem]? = nil
    ) {
        self.label = label
        self.value = value
        self.children = children
    }
}

extension DeviceInfoItem: CustomStringConvertible {
    public var description: String {
        let base = "\(label): \(value)"
        var childrenDebug = ""
        if let children = children {
            childrenDebug += "\n"
            childrenDebug += """
                                 Children [
                                    \(children.map { $0.description }.joined(separator: "\n"))
                                 ]
                             """
        }
        
        return base + childrenDebug
    }
}

public struct FingerprintTree {
    public let info: DeviceInfoItem
    public let children: [FingerprintTree]?
    
    let fingerprintData: Data
    
    public var fingerprint: String {
        return String.from(fingerprintData)
    }
}
