//
//  GetData.swift
//  SampleFirebase
//
//  Created by 秋山悠 on 2023/03/26.
//

import Foundation
import Firebase

class GetData {
    
    var dataModelArray: [DataModel] = []
    
    func getData(completion: @escaping (([DataModel]) -> Void)) {
        let db = Firestore.firestore()
        db.collection("datas").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print(error)
                print("データ取得エラー")
                return
            }
            
            self.dataModelArray = querySnapshot!.documents.map { document in
                let data = DataModel(document: document)
                return data
            }
            print("データ取得しました")
            print(self.dataModelArray.count)

            completion(self.dataModelArray)
        }
        
        
    }
}
