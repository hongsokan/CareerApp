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


struct Companys {
    
//    var title: String?
//    var companyName: String?
//    var dueDate: String?
//    var link: String?
    
//    var dueDate: Date?
//    var link: URL?
//    var content: String?
    
    var titlesArray = [String]()
    var linksArray = [String]()
    var namesArray = [String]()
    var datesArray = [String]()
    
    var isCellExpandable: Bool?
    
    init(){}
    
    init(titles: [String], names: [String], dates: [String], links: [String]) {
        self.titlesArray = titles
        self.namesArray = names
        self.datesArray = dates
        self.linksArray = links
    }
    
    /*
    init(title: String?, companyName: String?, dueDate: String?, link: String?) {
        self.title = title
        self.companyName = companyName
        self.dueDate = dueDate
        self.link = link
    }   */
}
