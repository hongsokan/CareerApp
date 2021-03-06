//
//  ViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/06/11.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit
import EventKit

import RxCocoa
import RxSwift
import SnapKit
import SwiftSoup


class ViewController: UIViewController {
    
    
    var companyList: Companys = Companys()
    
    lazy var tableView = UITableView()
    var cellIdentifier: String = "CompanyTableViewCell"
    var searchBar = UISearchBar()
    
    var shownTitles = [String]()
    let disposeBag = DisposeBag()
    
    var sampleEventStore: EKEventStore = EKEventStore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.tableView.register(CompanyTableViewCell.self,forCellReuseIdentifier: "CompanyTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        getData()
        input()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
        setConstraint()
    }
}


// MARK: Table View Delegate, DataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shownTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CompanyTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = self.shownTitles[indexPath.row]
        cell.titleLabel.numberOfLines = 0
        
        return cell
    }
}


// MARK: Methods
extension ViewController {
    
    // MARK: Views
    func setConstraint() {
        
        // SearchBar
        self.view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
        
        // TableView
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo((self.tabBarController?.tabBar.snp.top)!)
        }
    }
    
    // MARK: Get Data from Web Page
    func getData() {
        
        var getTitles = [String]()
        var getLinks = [String]()
        var getNames = [String]()
        var getDates = [String]()
        
        let urlAddress = "http://www.saramin.co.kr/zf_user/search?searchword=IOS&go=&flag=n&searchMode=1&searchType=&search_done=y&search_optional_item=n"
        
        guard let url = URL(string: urlAddress) else { return }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            
            let titles: Elements = try doc.body()!.select("div.item_recruit").select("h2.job_tit")
            for element in titles.array() {
                getTitles.append(try element.text())
            }
            
            let links: Elements = try doc.body()!.select("div.item_recruit").select("h2.job_tit").select("a")
            for element in links.array() {
                getLinks.append(try element.attr("href"))
            }
            
            let companyNames: Elements = try doc.body()!.select("div.area_corp").select("strong.corp_name")
            for element in companyNames.array() {
                getNames.append(try element.text())
            }
            
            let dueDates: Elements = try doc.body()!.select("div.job_date").select("span.date")
            for element in dueDates.array() {
                getDates.append(try element.text())
            }
            
        } catch let error {
            print("Error: ", error)
        }
        
        companyList = Companys(titles: getTitles, names: getNames, dates: getDates, links: getLinks)
        self.shownTitles = companyList.titlesArray
    }
    
    
    // MARK: Search Method
    private func input() {
        self.searchBar.rx.text.orEmpty.debounce(RxTimeInterval.microseconds(5), scheduler: MainScheduler.instance).distinctUntilChanged().filter{ !$0.isEmpty }.subscribe(onNext: { t in
            self.shownTitles = self.companyList.titlesArray.filter{ $0.hasPrefix(t) }
            self.tableView.reloadData()
        }).disposed(by: self.disposeBag)
    }
    
    
}
