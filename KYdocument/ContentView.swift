//
//  ContentView.swift
//  KYdocument
//
//  Created by Xcode2021 on 2021/09/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = Data()

    var body: some View {
        NavigationView {
            VStack {
                Text("名前（血液型）")
                ForEach(0 ..< data.now_name.count, id: \.self) {index in
                    Text(data.now_name[index])
                }
                Text("作業項目")
                ForEach(0 ..< data.now_sagyo.count, id:\.self) {index in
                    Text(data.now_sagyo[index])
                }
                Text("危険予知項目")
                ForEach(0 ..< data.now_kiken.count, id:\.self) {index in
                    Text(data.now_kiken[index])
                }
                Text("安全対策項目")
                ForEach(0 ..< data.now_anzen.count, id:\.self) {index in
                    Text(data.now_anzen[index])
                }
                NavigationLink(destination: inputView(data: data)) {
                    Text("編集＆入力画面へ")
                }
            }

            .navigationTitle("危険予知＆対策記録")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            let tmp_n1 = UserDefaults.standard.array(forKey: "DIC_NAME") as? [String]
            let tmp_n2 = UserDefaults.standard.array(forKey: "NOW_NAME") as? [String]
            if (tmp_n1 != nil) && (tmp_n2 != nil) {
                data.dic_name = tmp_n1!
                data.now_name = tmp_n2!
            }
            let tmp_s1 = UserDefaults.standard.array(forKey: "DIC_SAGYO") as? [String]
            let tmp_s2 = UserDefaults.standard.array(forKey: "NOW_SAGYO") as? [String]
            if (tmp_s1 != nil) && (tmp_s2 != nil) {
                data.dic_sagyo = tmp_s1!
                data.now_sagyo = tmp_s2!
            }
            let tmp_k1 = UserDefaults.standard.array(forKey: "DIC_KIKEN") as? [String]
            let tmp_k2 = UserDefaults.standard.array(forKey: "NOW_KIKEN") as? [String]
            if (tmp_k1 != nil) && (tmp_k2 != nil) {
                data.dic_kiken = tmp_k1!
                data.now_kiken = tmp_k2!
            }
            let tmp_a1 = UserDefaults.standard.array(forKey: "DIC_ANZEN") as? [String]
            let tmp_a2 = UserDefaults.standard.array(forKey: "NOW_ANZEN") as? [String]
            if (tmp_a1 != nil) && (tmp_a2 != nil) {
                data.dic_anzen = tmp_a1!
                data.now_anzen = tmp_a2!
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
