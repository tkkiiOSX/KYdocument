//
//  NameView.swift
//  KYdocument
//
//  Created by Xcode2021 on 2021/09/25.
//

import SwiftUI

struct NameView: View {
    @ObservedObject var data: Data
    @State var plusname: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{


            Text("参加者氏名（血液型）")
            Text("追加登録された名前")
            ForEach(0 ..< data.dic_name.count, id: \.self) {index in
                HStack{
                    Text(data.dic_name[index])
                    Button(action: {
                        data.now_name.append(data.dic_name[index])
                    }) {
                        Text("追加")
                    }
                    Button(action: {
                        data.dic_name.remove(at: index)
                    }) {
                        Text("削除")
                    }
                }

            }
            Spacer()
                .frame(height: 10)
            Text("反映される名前")
            ForEach(0 ..< data.now_name.count, id: \.self) {index in
                HStack{
                    Text(data.now_name[index])
                    Button(action: {
                        data.now_name.remove(at: index)

                    }) {
                        Text("削除")
                    }
                }

            }
            Spacer()
                .frame(height: 10)
            Button(action: {
                data.dic_name.append(plusname)
                plusname = ""
            }) {
                Text("名前を辞書へ追加")
            }
            TextField("ここに名前を入れてください。", text: $plusname)
        }
        .navigationTitle("名前選択＆編集画面")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            UserDefaults.standard.set(data.dic_name, forKey: "DIC_NAME")
            UserDefaults.standard.set(data.now_name, forKey: "NOW_NAME")

            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("＜保存し戻る")
        })
        .navigationBarTitleDisplayMode(.large)
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(data: Data())
    }
}
