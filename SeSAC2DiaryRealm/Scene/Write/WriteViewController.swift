//
//  WriteViewController.swift
//  SeSAC2DiaryRealm
//
//  Created by jack on 2022/08/21.
//

import UIKit
import RealmSwift

class WriteViewController: BaseViewController {

    let mainView = WriteView()
    let localRealm = try! Realm()
    
    override func loadView() {
        self.view = mainView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Realm is located at:", localRealm.configuration.fileURL!)
    }
    
    override func configure() {
        mainView.searchImageButton.addTarget(self, action: #selector(selectImageButtonClicked), for: .touchUpInside)
        mainView.sampleButton.addTarget(self, action: #selector(sampleButtonClicked), for: .touchUpInside)
    }
    
    // Realm Create Sample
    @objc func sampleButtonClicked() {
        
        let task = UserDiary(diaryTitle: "오늘의 일기\(Int.random(in: 1...1000))", diaryContent: "일기 테스트 내용", writeDate: Date(), uploadDate: Date(), favorite: false, photo: nil)
        
        try! localRealm.write {
            localRealm.add(task)  // Create
            print("Realm succeed")
        }

    }
      
    @objc func selectImageButtonClicked() {
        let vc = SearchImageViewController()
        transition(vc)
    }
}

