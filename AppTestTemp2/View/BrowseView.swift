//
//  BrowseView.swift
//  AppTestTemp2
//
//  Created by Thanh Nguyen Viet on 19/05/2024.
//

import SwiftUI

struct BrowseView : View {
    @Binding var showBrowse : Bool
    
    var body: some View {
        NavigationView {
            ScrollView() {
                ModelsByCategoryGrid()
            }.navigationTitle(Text("Browse"))
                .navigationBarItems(trailing: Button(action: {
                    print("Browse View is Dismissed")
                    self.showBrowse.toggle()
                }) {
                    Text("Done").bold()
                })
        }
    }
}

struct HorizontalGrid : View {
    
    var title: String
    var items: [Model]
    
    private let gridItemLayout = [GridItem(.fixed(150))]
    var body: some View {
        VStack(alignment: .leading) {
            Separator()
            Text(title)
                .font(.title2).bold()
                .padding(.leading,22)
                .padding(.top,10)
            
            ScrollView(.horizontal,showsIndicators: false ) {
                LazyHGrid(rows: gridItemLayout, spacing: 30) {
                    ForEach(0..<items.count) {
                        index in
                        
                        let model = items[index]
                        
                        ItemButton(model: model, action: {
                            //TODO : call model method to async load model Entity
                            //TODO : select model for placement
                            print("BrowseView: selected\(model.name)")
                        })
                        
                    }
                }
                .padding(.horizontal,22)
                .padding(.vertical,10)
            }
        }
    }
}


struct ModelsByCategoryGrid : View {
    var body: some View {
        VStack {
            ForEach(ModelCategory.allCases, id: \.self) {
                category in
                HorizontalGrid(title: category.label, items: Models().all)
            }
        }
    }
}

struct Separator : View {
    var body: some View {
        Divider()
            .padding(.horizontal,20)
            .padding(.vertical,10)
    }
}

struct ItemButton : View {
    let model: Model
    let action: () -> Void
    var body: some View {
        Button(action: {
            self.action
        }) {
            Image(uiImage: self.model.thumbnail)
                .resizable()
                .frame(height: 150)
                .aspectRatio(1/1,contentMode: .fit)
                .cornerRadius(8.0)
        }
    }
}
