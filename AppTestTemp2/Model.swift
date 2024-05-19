//
//  Model.swift
//  AppTestTemp2
//
//  Created by Thanh Nguyen Viet on 19/05/2024.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory : CaseIterable {
    case VietnamModel
    case model2
    case model3
    case model4
    
    var label : String {
        get {
            switch self {
            case .VietnamModel:
                return "Vietnam Model"
            case .model2:
                return "model2"
            case .model3:
                return "model3"
            case .model4:
                return "model4"
            }
        }
    }
}

class Model {
    var name : String
    var category : ModelCategory
    var thumbnail : UIImage
    var modelEntity : ModelEntity?
    var scaleCompensation : Float
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1 ) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
    }
    
    //Create A mothod to async load modelEntity
}

struct Models {
    var all : [Model] = []
    
    init() {
        // Vietnam historic model
        let fragment1 = Model(name: "MaisonTay_TayHouse", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment2 = Model(name: "NhaMo_GiaLai", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment3 = Model(name: "DanMoi_LamDong", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment4 = Model(name: "Fragment", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment5 = Model(name: "GuiDeoTran", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment6 = Model(name: "Mask-Dao_LaoCai", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment7 = Model(name: "NhaRong_GiaLai", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment8 = Model(name: "NhaRong_KonTum", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment9 = Model(name: "NhaRong_QuangNam", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment10 = Model(name: "NhaThaiTrang_LaiChau", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment11 = Model(name: "TuiDaThu", category: .VietnamModel, scaleCompensation: 0.001)
        let fragment12 = Model(name: "TuongMo_GiaLai", category: .VietnamModel, scaleCompensation: 0.001)
        self.all += [fragment1,fragment2,fragment3,fragment4,fragment5,fragment6,fragment7,fragment8,fragment9,fragment10,fragment11,fragment12]
        
        // model2
        //model 3
        //model 4 in the development time...
        
        
    }
    
    func get(category:ModelCategory) -> [Model] {
        return all.filter({$0.category == category})
    }
}
