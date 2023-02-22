//
//  Extensions.swift
//  WantedPO
//
//  Created by dahnyue on 2023/02/22.
//

import UIKit

extension UIImageView {
    /// URL에서 이미지 다운로드하여 이미지뷰에 적용
    func download(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async { [weak self] in
                    // 실패 시 기본이미지
                    self?.image = UIImage(systemName: "photo")
                }
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}

extension Collection {
    /// 안전한 배열 요소 컨트롤을 위한 구문
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
