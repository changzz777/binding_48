//
//  weight_page.swift
//  binding_48
//
//  Created by User04 on 2020/12/21.
//

import SwiftUI

struct weight_page: View {
    var weight : CGFloat
    var gender : Int
    var themecolor : Color
    var body: some View {
        NavigationView{
            VStack{
                let txt = check(weight: weight)
                RoundedRectangle(cornerRadius: 20)
                    .fill(themecolor)
                    .frame(width:300,height:400)
                    .overlay(
                        Text(txt)
                            .bold()
                            .font(.title)		
                    )
//                NavigationLink(destination:Color.white){
//                    Button(action:{})
//                    {
//                        Text("抽選手")
//                            .bold()
//                            .font(.title2)
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(themecolor)
//                            .cornerRadius(25)
//                            .shadow(color: .gray, radius: 5, x:2, y:4)
//                    }
//                }
//                .padding()
            }
            .background(Image("bg").resizable().opacity(0.8).frame(width:400,height:1200))
        }
    }
}

func check(weight:CGFloat) -> String{
    var tmp : String = ""
    if weight >= 57 && weight <= 61{
        tmp = "你是雛量級的選手！"
    }
    else if weight > 61 && weight <= 65{
        tmp = "你是羽量級的選手！"
    }
    else if weight > 65 && weight <= 70{
        tmp = "你是輕量級的選手！"
    }
    else if weight > 70 && weight <= 77{
        tmp = "你是次中量級的選手！"
    }
    else if weight > 77 && weight <= 83{
        tmp = "你是中量級的選手！"
    }
    else if weight > 83 && weight <= 92{
        tmp = "你是輕重量級的選手！"
    }
    else if weight > 92 && weight <= 120{
        tmp = "你是重量級的選手！"
    }
    else{
        tmp = "該體重無量級！"
    }
    return tmp
}

struct weight_page_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
