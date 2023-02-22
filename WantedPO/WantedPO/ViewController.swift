//
//  ViewController.swift
//  WantedPO
//
//  Created by dahnyue on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loadAllImagesButton: UIButton!
    
    /// 이미지 URL 배열
    let imageURLArray: [URL?] = [
         URL(string: "https://cdn.pixabay.com/photo/2016/12/19/21/36/woman-1919143_1280.jpg"),
         URL(string: "https://cdn.pixabay.com/photo/2023/02/08/07/32/vietnamese-woman-7775904__480.jpg"),
         URL(string: "https://cdn.pixabay.com/photo/2016/03/15/17/17/sexy-1258739_1280.jpg"),
         URL(string: "https://cdn.pixabay.com/photo/2017/08/18/16/53/portrait-2655644_1280.jpg"),
         URL(string: "https://cdn.pixabay.com/photo/2016/11/29/02/28/woman-1866858_1280.jpg")
    ]
    
    /// 셀 높이
    let CELL_HEIGHT: CGFloat = 90
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cell이 생성될 수에 맞춰 테이블 크기를 정해줌
        self.tableViewHeightConstraint.constant = self.CELL_HEIGHT * CGFloat(self.imageURLArray.count)
        
        self.tableView.register(UINib(nibName: "LoadImageTableViewCell", bundle: nil), forCellReuseIdentifier: "LoadImageTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.isScrollEnabled = false
    }
    
    /// Load All Images 버튼 클릭
    @IBAction func tchdLoadAllImagesButton(_ sender: UIButton) {
        for index in 0..<self.imageURLArray.count {
            guard let cell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? LoadImageTableViewCell else { return }
            // 각 셀을 다시 로드
            cell.loadImage()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.imageURLArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoadImageTableViewCell", for: indexPath) as? LoadImageTableViewCell else { return LoadImageTableViewCell() }
        guard let row = self.imageURLArray[safe: indexPath.row] else {
            cell.initiate(nil)
            return cell
        }
        
        cell.initiate(row)
        
        return cell
    }
}
