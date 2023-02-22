//
//  LoadImageTableViewCell.swift
//  WantedPO
//
//  Created by dahnyue on 2023/02/22.
//

import UIKit

class LoadImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loadImageView: UIImageView!
    @IBOutlet weak var loadProgressView: UIProgressView!
    @IBOutlet weak var loadButton: UIButton!
    
    var imageURL: URL? {
        didSet {
            if imageURL == nil {
                self.loadImageView.image = UIImage(systemName: "photo")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        self.commonInit()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.commonInit()
    }
    
    /// Cell의 통상 init, 생성이나 reuse 시의 초기화에 사용
    private func commonInit() {
        self.imageURL = nil
    }
    
    /// Cell의 초기화 함수
    func initiate(_ url: URL?) {
        self.imageURL = url
        self.loadImage()
    }
    
    /// 실질적으로 Cell에 주어진 이미지를 다운로드하고 적용하기 위한 함수
    func loadImage() {
        self.loadImageView.image = UIImage(systemName: "photo")
        guard let url = self.imageURL else { return }
        self.loadImageView.download(from: url)
    }
    
    /// Load 버튼 클릭
    @IBAction func tchdLoadbutton(_ sender: UIButton) {
        self.loadImage()
    }
}
