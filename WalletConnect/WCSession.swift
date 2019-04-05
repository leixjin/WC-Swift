//
//  WCSession.swift
//  WallectConnect
//
//  Created by Tao Xu on 3/29/19.
//  Copyright © 2019 Trust. All rights reserved.
//

import Foundation
import CryptoSwift

public struct WCSession {
    public let topic: String
    public let version: String
    public let bridge: URL
    public let key: Data

    public init?(string: String) {
        guard string .hasPrefix("wc:") else {
            return nil
        }

        let urlString = string.replacingOccurrences(of: "wc:", with: "wc://")
        guard let url = URL(string: urlString),
            let topic = url.user,
            let version = url.host,
            let components = NSURLComponents(url: url, resolvingAgainstBaseURL: false) else {
                return nil
        }

        var dicts = [String: String]()
        for query in components.queryItems ?? [] {
            if let value = query.value {
                dicts[query.name] = value
            }
        }
        guard let bridge = dicts["bridge"],
            let bridgeUrl = URL(string: bridge),
            let key = dicts["key"] else {
                return nil
        }

        self.topic = topic
        self.version = version
        self.bridge = bridgeUrl
        self.key = Data(hex: key)
    }
}