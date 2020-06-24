//
//  Model.swift
//  Career
//
//  Created by 안홍석 on 2020/06/11.
//  Copyright © 2020 안홍석. All rights reserved.
//

import Foundation


// 제목
// 기업 이름
// 마감일
// 메모 (경력, 급여, 학력, 근무지역, 근무형태)


struct Company {
    var title: String?
    var companyName: String?
    var dueDate: Date?
    var link: URL?
//    var content: String?
    
    init() {}
    
    init(title: String?, companyName: String?, dueDate: Date?, link: URL?) {
        self.title = title
        self.companyName = companyName
        self.dueDate = dueDate
        self.link = link
    }
}
