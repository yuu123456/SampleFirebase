//
//  DataModel.swift
//  SampleFirebase
//
//  Created by 秋山悠 on 2023/02/12.
//

import Foundation
import Firebase

struct DataModel {
//    var id: String
    var title: String?
    var content: String?
    
    //取得したデータを当てはめるために必要
    init(document: QueryDocumentSnapshot) {
//        self.id = document.documentID
        let Dic = document.data()
        self.title = Dic["タイトル"] as? String
        self.content = Dic["内容"] as? String
    }
}
