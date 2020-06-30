//
//  ViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/06/11.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit
import SwiftSoup
import EventKit
import SnapKit

class ViewController: UIViewController {
    
    var companyList: [Company] = [Company]()
    
    var titlesArray = [String]()
    var linksArray = [String]()
    var namesArray = [String]()
    var datesArray = [String]()
    
    lazy var tableView = UITableView()
    lazy var cellIdentifier: String = "cell"
    
    /*
    // imageView 생성
    private let img: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "")
        return imgView
    }()
    */
    
    // cell 내부 label
    private let label: UILabel = {
        let label = UILabel()
        label.text = "this is cell"
        label.textColor = UIColor.gray
        return label
    }()
    
    //    @IBOutlet weak var titleLabel: UILabel!
    //    @IBOutlet weak var nameLabel: UILabel!
    //    @IBOutlet weak var linkLabel: UILabel!
    //    @IBOutlet weak var dateLabel: UILabel!
    
    var sampleEventStore: EKEventStore = EKEventStore()
    
    
    /*
     @IBAction func sendToCalendar(_ sender: Any) {
     
     sampleEventStore.requestAccess(to: .event) { (granted, error) in
     if (granted) && (error == nil) {
     print("granted \(granted)")
     print("error \(String(describing: error))")
     
     let sampleEvent: EKEvent = EKEvent(eventStore: self.sampleEventStore)
     
     DispatchQueue.main.async {
     
     sampleEvent.title = self.titleLabel.text!
     sampleEvent.startDate = Date()
     sampleEvent.endDate = Date()
     sampleEvent.notes = "sample event"
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
     
     //        sampleEvent.title = titleLabel.text!
     //        sampleEvent.endDate = dateLabel.text!
     }
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
//        tableView.register(CodingCustomTableViewCell.self, forCellReuseIdentifier: "CodingCustomTableViewCell")
        
        setConstraint()
        
        // autoHeight
        // 만약 custom으로 cell의 크기를 유동적으로 변환시키고 싶다면 두줄을 추가
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        /*
         DispatchQueue.main.async {
         UIApplication.shared.isNetworkActivityIndicatorVisible = true
         }   */
        
        let urlAddress = "http://www.saramin.co.kr/zf_user/search?searchword=IOS&go=&flag=n&searchMode=1&searchType=&search_done=y&search_optional_item=n"
        
        guard let url = URL(string: urlAddress) else { return }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            
            
            
            let titles: Elements = try doc.body()!.select("div.item_recruit").select("h2.job_tit")
            
            for element in titles.array() {
                self.titlesArray.append(try element.text())
                //                print("Title : ", try element.text())
                //                print(titlesArray)
            }
            
            
            let links: Elements = try doc.body()!.select("div.item_recruit").select("h2.job_tit").select("a")
            
            for element in links.array() {
                self.linksArray.append(try element.attr("href"))
                //                print("Link : ", try element.attr("href"))
                //                print(linksArray)
            }
            
            
            let companyNames: Elements = try doc.body()!.select("div.area_corp").select("strong.corp_name")
            
            for element in companyNames.array() {
                self.namesArray.append(try element.text())
                //                print(namesArray)
            }
            
            
            let dueDates: Elements = try doc.body()!.select("div.job_date").select("span.date")
            
            for element in dueDates.array() {
                self.datesArray.append(try element.text())
                //                print(datesArray)
            }
            
            let sample: Company = Company(title: titlesArray.first!, companyName: namesArray.first!, dueDate: datesArray.first!, link: linksArray.first!)
            
            print(sample.title!)
            print(sample.companyName!)
            print(sample.dueDate!)
            print(sample.link!)
            
        } catch let error {
            print("Error: ", error)
        }
        
    }
    
    // MARK: Views
    
    func setConstraint() {
        
        // TableView
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
    }
    
    /*
    // 코드로 cell을 만들면 init을 생성해야 한다
    // 인터페이스 빌더에서는 자동으로 초기화를 해주지만, 코드에서는 인터페이스 빌더를 사용하는게 아니기 때문
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: cellIdentifier)

        setConstraint()

    }
 */

        

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }
    
}

/*
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CodingCustomTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
*/
