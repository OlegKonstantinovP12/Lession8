//
//  main.swift
//  Lession8
//
//  Created by Oleg Konstantinov on 27.09.2025.
//

import Foundation


 //MARK: -  Вычисляемые свойства

/*
 1 - Температурный конвертер
 Создай структуру Temperature с полем celsius: Double.
 Добавь вычисляемое свойство fahrenheit: Double, которое считает температуру в Фаренгейтах.
 */
struct Temperature {
    var celcius: Double
    var fahrenheit: Double {
        (celcius * 9 / 5) + 32
    }
}
let temp = Temperature(celcius: 100)
print(temp.fahrenheit)

/*
 2 - Создай структуру Rectangle с width и height.
 Добавь вычисляемое свойство perimeter, которое возвращает периметр.
 */
struct Rectangle {
    var width: Double
    var height: Double
    var perimeter: Double {
        2 * (width + height)
    }
}

let rectangle = Rectangle(width: 10, height: 7)
print(rectangle.perimeter)

/*
 3 - Банковский счёт
 Создай структуру BankAccount с полем balance: Double.
 Добавь вычисляемое свойство formattedBalance: String, которое возвращает строку вида "Ваш баланс: 1 000".
 Добавь вычисляемое свойство isOverdrawn: Bool — true, если balance < 0
 */
struct BankAccount {
    var balance: Double
    var formattedBalance: String {
        if !isOverdrawn {
            return "Ваш баланс равен: \(balance)"
        } else {
            return "Вы превысили лимит по карте"
        }
    }
    var isOverdrawn: Bool {
        balance < 0
    }
}

let card = BankAccount(balance: 100)
print(card.formattedBalance)
print(card.isOverdrawn)
print("")
let overdraftCard = BankAccount(balance: -100)

print(overdraftCard.formattedBalance)
print(overdraftCard.isOverdrawn)
print("")

/*
 4 - Задача про корзину покупок
 Создай структуру CartItem с name: String, pricePerItem: Double, quantity: Int.
 Добавь вычисляемое свойство totalPrice, которое возвращает итоговую стоимость (pricePerItem * quantity).
 */
struct CartItem {
    var name: String
    var pricePerItem: Double
    var quantity: Int
    var totalPrice: Double {

        let total = String(format: "%.2f", (pricePerItem * Double(quantity)))
        print(total)
        guard let total = Double(total) else { return 0 }
        return total
            }
//    pricePerItem * Double(quantity)
//    var printTotalPrice: String {
//        String(format: "Вы совершили покупку \(name) в количестве \(quantity). Итоговая сумма - %.2f", (totalPrice))
//    }
}
    
let cart = CartItem(name: "water", pricePerItem: 25.63, quantity: 3)
print(cart.totalPrice)
print("")

//MARK: -  Наблюдатели свойств
/*
 1 - Счётчик лайков
 Создай структуру Post с полем likes: Int.
 Добавь didSet, который печатает "Лайков стало \(likes)" после каждого изменения.
 */
struct Post {
    var likes: Int {
        didSet {
            print("Лайков стало \(likes)")
        }
    }
}
var post = Post(likes: 1)
post.likes = 2

/*
 2 - Счётчик шагов
 Создай структуру StepTracker с полем steps: Int.
 Добавь didSet, который печатает прогресс: "Сегодня пройдено \(steps) шагов".
 Если steps превысили 10_000 — выведи "Цель достигнута!"
 */
struct StepTracker {
    var steps:Int {
        didSet {
            print("Сегодня пройдено \(steps)")
            if steps > 10_000 {
                print("Цель достигнута")
            }
        }
    }
}
var countOfSteps = StepTracker(steps: 10)
countOfSteps.steps += 1000
countOfSteps.steps += 10_000

/*
 3 - Счётчик денег
 Создай структуру Wallet с полем money: Double.
 В didSet проверяй, если money < 0 — печатай "У вас долг!".
 Если money > oldValue — печатай "Поступление: \(money - oldValue)".
 Если money < oldValue — печатай "Трата: \(oldValue - money)".
 */
struct Wallet {
    var money: Double {
        didSet {
            switch money {
            case _ where money < 0:
                print("У вас долг!")
            case _ where money < oldValue:
                print("Трата: \(oldValue - money)")
            case _ where money > oldValue:
                print("Поступление: \(money - oldValue)")
            default:
                print("")
            }
        }
    }
}
var wallet = Wallet(money: 1000)
wallet.money += 100
wallet.money -= 500
wallet.money -= 1500

/*
 4 - Проверка пароля
 Создай структуру UserAccount с полем password: String.
 В willSet проверь, если новый пароль короче 6 символов — напечатай "Пароль слишком короткий!".
 В didSet выведи "Пароль обновлён" (если он не пустой).
 */
struct UserAccount {
    var password: String {
        willSet{
            if newValue.count < 6 {
                print("Пароль слишком короткий!")
            }
        }
        didSet {
            if !password.isEmpty {
                print("Пароль обновлён")
            }
        }
    }
}
var changePassword = UserAccount(password: "123456")
changePassword.password = "four"

