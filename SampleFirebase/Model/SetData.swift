//
//  SetData.swift
//  SampleFirebase
//
//  Created by 秋山悠 on 2023/02/12.
//

import Foundation
import Firebase

struct SetData {
    
    func setData(title: String, content: String) {
        let db = Firestore.firestore()
        db.collection("datas").document("1").setData([
            "タイトル": title,
            "内容": content
        ]) { error in
            if let error = error {
                print("ドキュメントの書き込みに失敗しました",error)
            } else {
                print("ドキュメントの書き込みに成功しました")
            }
        }
    }
}
