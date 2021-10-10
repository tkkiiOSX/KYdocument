//
//  inputView.swift
//  KYdocument
//
//  Created by Xcode2021 on 2021/09/25.
//

import SwiftUI

struct inputView: View {
    @ObservedObject var data: Data
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            VStack {
                Text("名前（血液型）")
                ForEach(0 ..< data.now_name.count, id: \.self) {index in
                    Text(data.now_name[index])
                }
                NavigationLink(destination: NameView(data: data)) {
                    Text("名前を選択＆追加")
                }
                Text("作業内容")
                ForEach(0 ..< data.now_sagyo.count, id: \.self) {index in
                    Text(data.now_sagyo[index])
                }
                NavigationLink(destination: SagyoView()) {
                    Text("作業内容を選択＆追加")
                }
            }
            VStack {
                Text("危険予知洗い出し")
                ForEach(0 ..< data.now_kiken.count, id: \.self) {index in
                    Text(data.now_kiken[index])
                }
                NavigationLink(destination: KikenView()) {
                    Text("危険予知洗い出しを選択＆追加")
                }
                Text("安全対策")
                ForEach(0 ..< data.now_anzen.count, id: \.self) {index in
                    Text(data.now_anzen[index])
                }
                NavigationLink(destination: AnzenView()) {
                    Text("安全対策を選択＆編集")
                }
            }

        }
        .navigationTitle("選択＆編集画面")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("＜戻る")
        })
    }
}

struct inputView_Previews: PreviewProvider {
    static var previews: some View {
        inputView(data: Data())
    }
}
