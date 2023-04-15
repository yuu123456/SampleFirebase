//
//  ViewController.swift
//  SampleFirebase
//
//  Created by 秋山悠 on 2023/02/12.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate {
    var dataModel: [DataModel] = []
    var setData: SetData = SetData()
    var addData: AddData = AddData()
    var getData: GetData = GetData()


    
    @IBOutlet var titleText: UITextField!
    @IBOutlet var contentText: UITextField!
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func saveData(_ sender: UIButton) {
        setData.setData(title: titleText.text!, content: contentText.text!)
        let closure = { response in

            print("クロージャ実行。以下は取得したデータです")
            print(response)
            print("以上")
            self.tableview.reloadData()
        }

        getData.getData(completion: closure)
    }
    @IBAction func addData(_ sender: UIButton) {
        addData.AddData(title: titleText.text!, content: contentText.text!)
        let closure = { response in

            print("クロージャ実行。以下は取得したデータです")
            print(response)
            print("以上")
            self.tableview.reloadData()
        }

        getData.getData(completion: closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let closure = { response in

            print("クロージャ実行。以下は取得したデータです")
            print(response)
            print("以上")
            self.tableview.reloadData()
        }
        
        getData.getData(completion: closure)
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableview.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData.dataModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",for: indexPath) as? TableViewCell
        cell?.titleLabel.text = self.getData.dataModelArray[indexPath.row].title
        cell?.contentLabel.text = self.getData.dataModelArray[indexPath.row].content
        return cell!
    }
}
