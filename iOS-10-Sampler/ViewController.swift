//
//  ViewController.swift
//  iOS-10-Sampler
//
//  Created by shf2 on 2016/10/14.
//  Copyright © 2016年 shf2. All rights reserved.
//

import UIKit

class MyClass {
    var str: String
    init(str: String) {
        self.str = str
    }
}

class MySuClass: MyClass {
    init(i: Int) {
        super.init(str: String(i))
    }

    func descripion() {
        print("\(self.str)")
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    fileprivate let dataSource = SampleDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tableView.register(SampleTableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.reloadData()

        let mySubClass = MySuClass(i: 11);
        mySubClass.descripion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.samples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? SampleTableViewCell else {
            fatalError()
        }

        let sample = dataSource.samples[indexPath.row]
        cell.showSample(sample: sample)
        return cell
    }

    //MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let sample = dataSource.samples[indexPath.row]
        navigationController?.pushViewController(sample.controller(), animated: true)
    }
    
}

