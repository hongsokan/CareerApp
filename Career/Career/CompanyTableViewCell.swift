//
//  CompanyTableViewCell.swift
//  Career
//
//  Created by 안홍석 on 2020/07/01.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit
import EventKit

import SnapKit


class CompanyTableViewCell: UITableViewCell {
    
    var sampleEventStore: EKEventStore = EKEventStore()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(sendToCalendar(_:)), for: .touchUpInside)
        return button
    }()
    
    
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


extension CompanyTableViewCell {
    
    // MARK: Cell View
    func setConstraint() {
        
        // titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing).multipliedBy(0.8)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        // addButton
        contentView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(titleLabel.snp.trailing).multipliedBy(1.1)
            make.trailing.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    
    
    @objc func sendToCalendar(_ sender: UIButton) {
        
        sampleEventStore.requestAccess(to: .event) { (granted, error) in
            
            // 캘린더 접근 허용 && 오류 없을 경우
            if (granted) && (error == nil) {
                print("granted \(granted)")
                print("error \(String(describing: error))")
                
                let sampleEvent: EKEvent = EKEvent(eventStore: self.sampleEventStore)
                
                DispatchQueue.main.async {
                    
                    sampleEvent.title = self.titleLabel.text
                    sampleEvent.startDate = Date()
                    sampleEvent.endDate = Date()
                    sampleEvent.notes = "notes"
                    sampleEvent.calendar = self.sampleEventStore.defaultCalendarForNewEvents
                    
                    do {
                        try self.sampleEventStore.save(sampleEvent, span: .thisEvent)
                    } catch let error as NSError {
                        print("failed to save event with error : \(error)")
                    }
                    print("Saved Event")
                }
            }
            else {
                print("failed to save event with error : \(String(describing: error)) or access not granted")
            }
        }
        
        
    }
    
}
