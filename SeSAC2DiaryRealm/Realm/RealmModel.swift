//
//  RealmModel.swift
//  SeSAC2DiaryRealm
//
//  Created by CHOI on 2022/08/22.
//

import Foundation
import RealmSwift

// UserDiary: 테이블 이름
// @Persisted: 각 컬럼
class UserDiary: Object {
    @Persisted var diaryTitle: String    // 제목(필수)
    @Persisted var diaryContent: String? // 내용(옵션)
    @Persisted var writeDate = Date()    // 작성 날짜(필수)
    @Persisted var uploadDate = Date()   // 등록 날짜(필수)
    @Persisted var favorite: Bool       // 즐겨찾기(필수)
    @Persisted var photo: String?        // 사진String(옵션)
    
    // PK(필수): Int, String(부적합), UUID, ObjectID
    @Persisted(primaryKey: true) var objectId: ObjectId?
    
    convenience init(diaryTitle: String, diaryContent: String?, writeDate: Date, uploadDate: Date, favorite: Bool, photo: String?) {
        self.init()
        self.diaryTitle = diaryTitle
        self.diaryContent = diaryContent
        self.writeDate = writeDate
        self.uploadDate = uploadDate
        self.favorite = false
        self.photo = photo
    }
}
