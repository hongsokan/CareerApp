//
//  CompanyTableViewCell.swift
//  Career
//
//  Created by 안홍석 on 2020/07/01.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit
import SnapKit

class CompanyTableViewCell: UITableViewCell {
    
    // MARK: Cell View
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = UIColor.black
        return label
    }()
    
    func setConstraint() {
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    
    // MARK: Cell init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Cell Method
    
    // awakeFromNib() 은 객체가 초기화 된 후 호출
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // 셀 선택 시 공고,회사,지원마감일,링크 등 자세한 내용 보여주는 화면으로
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    
}
