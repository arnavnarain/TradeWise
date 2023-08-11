//
//  ImageViewUtils.swift
//  TradeWise
//
//  Created by user239353 on 6/19/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadRemoteImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
