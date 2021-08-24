//
//  ImageExtension.swift
//  app
//
//  Created by Oskar on 24/08/2021.
//

import SwiftUI

extension Image {
    init?(base64String: String) {
        let x = base64String.replacingOccurrences(of: "data:image/jpeg;base64,", with:  "")
        guard let data = Data(base64Encoded: x) else {
            return nil
        }
        guard let uiImage = UIImage(data: data) else {
            return nil
        }
        self = Image(uiImage: uiImage)
    }
}
