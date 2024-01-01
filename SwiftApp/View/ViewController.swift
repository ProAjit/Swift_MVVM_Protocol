//
//  ViewController.swift
//  SwiftApp
//
//  Created by Ajit Satarkar on 13/12/23.
//

import UIKit
import OSLog

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!  
    
    var runMockeyViewModel = RunMockeyViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        // Do any additional setup after loading the view.
        runMockeyViewModel.delegate = self
    }
        
    override func viewDidAppear(_ animated: Bool) {
        runMockeyViewModel.callRunMockeyAPI()
    }
    
}

//MARK: - RunMockeyProtocol

extension ViewController: RunMockeyProtocol {
    
    func returnData(runMockeyData : Welcome?) {
        // Hide the user’s age.
        Logger().info("mocky: \(runMockeyData.debugDescription, privacy: .private)")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func returnError(error : UserError?) {
        let customLog = Logger(subsystem: "com.your_company.your_subsystem",
                  category: "your_category_name")
        customLog.error("\(error)")
    }

}

//MARK: - TableViewDelegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let modelData = runMockeyViewModel.runMockeyData?.data else {
            return 0
        }
        return modelData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get cell type
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = runMockeyViewModel.runMockeyData?.data[indexPath.row].type.capitalized
        cell.textLabel?.textColor = .black
        return cell
    }
    
    
}
