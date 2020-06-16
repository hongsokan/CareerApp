//
//  ViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/06/11.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {

    var willTitleArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlAddress = "http://www.saramin.co.kr/zf_user/jobs/relay/view?isMypage=no&rec_idx=38266797&recommend_ids=eJxtkLcNQzEMRKdxzxxqD6L9tzDxbZGC4EbA0zHckYM0VW3V%2B%2FI3H7jk%2B8EQgUsNL9w6eYaM7iGQf3CXB4HSMqALt16bSceOF3mPw3RRnG4RRK5iu7C9o%2FhRrsaJR9SNHSWYffTGrRuHxmRrbO8QKLOOs7KMO7I61XRTkvNy%2BamsiNC9EJqgMwqA8znTB7JGXuk%3D&view_type=search&searchword=IOS&searchType=auto&gz=1&t_ref_content=generic&t_ref=search&paid_fl=n#seq=0"
        
        guard let url = URL(string: urlAddress) else { return }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            
//            let title: Element = try doc.select("wrap_jview").select("jview jview-0-38266797").select("wrap_jv_cont").select("wrap_jv_header").select("jv_header").select("a").select("company").first()!
            
            let title: Elements = try doc.select("wrap_jview").select("jview jview-0-38266797").select("wrap_jv_cont").select("wrap_jv_header").select("jv_header").select("a")
            
            print(try title.attr("href"))
            print(try title.attr("title"))
            print(try title.attr("company"))

            
            /*
            for element in title.array() {
                self.willTitleArray.append(try element.attr("title"))
                print("Title : ", try element.attr("title"))
            }

            
            print(try title.text())
            */
            
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }
    }
    

}
