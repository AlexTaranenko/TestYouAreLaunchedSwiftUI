//
//  SVGImgProcessor.swift
//  TestYouAreLaunched
//
//  Created by Alex on 25.04.2023.
//

import Kingfisher
import SVGKit
import UIKit

public struct SVGImgProcessor: ImageProcessor {
    
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
