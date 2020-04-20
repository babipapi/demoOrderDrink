//
//  DrinkMenu.swift
//  demoOrderDrink
//
//  Created by Daniel on 2020/4/12.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

struct Drink {
    let title:String
    let pic:String
    let intro:String
}

let drink1 = Drink(title: "熟成紅茶", pic: "tea-1", intro: "解炸物/燒烤肉類油膩，茶味濃郁帶果香")
let drink2 = Drink(title: "麗春紅茶", pic: "tea-2", intro: "去除海鮮羶腥，茶味較淡帶花香")
let drink3 = Drink(title: "太妃紅茶", pic: "tea-3", intro: "咖啡與茶的神秘搭配")
let drink4 = Drink(title: "熟成冷露", pic: "tea-4", intro: "手工冬瓜與茶，更神秘比例搭配")
let drink5 = Drink(title: "雪花冷露", pic: "tea-5", intro: "手工冬瓜獨奏")
let drink6 = Drink(title: "春芽冷露", pic: "tea-6", intro: "手工冬瓜綠茶")
let drink7 = Drink(title: "春芽綠茶", pic: "tea-7", intro: "綠茶，絲中帶綠")
let drink8 = Drink(title: "春梅冰茶", pic: "tea-8", intro: "春梅與冬瓜相遇")
let drink9 = Drink(title: "冷露歐蕾", pic: "tea-9", intro: "手工冬瓜與鮮奶")
let drink10 = Drink(title: "熟成歐蕾", pic: "tea-10", intro: "熟成鮮奶茶")
let drink11 = Drink(title: "白玉歐蕾", pic: "tea-11", intro: "珍奶不解釋")
let drink12 = Drink(title: "熟成檸果", pic: "tea-12", intro: "每日限量的鮮檸紅茶，整顆檸檬搭配7分糖最佳")


struct OrderDrinkData:Codable {
    let data:[OrderDrink]
}

struct OrderDrink:Codable {
    let name:String
    let drinkname:String
    let ice:String
    let suger:String
    let bubble:String
    let capacity:String
}

