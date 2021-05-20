import Foundation

// Subsystem
struct AuthenService {
    func logInWithFacebook(email: String) {
        print("Loggin in with your facebook at: \(email)")
    }
    
    func logInWithPhonenumber(number: String) {
        print("Loggin in with your phonenumber at: \(number)")
    }
    
    func resetPassword() {
        print("Resetting your password")
    }
}

struct PurchaseService {
    func buyFood() {
        print("Buy food")
    }
    
    func buyDrink() {
        print("Buy drink")
    }
    
    func buyClothes() {
        print("Buy clothes")
    }
}

struct ShippingService {
    func shipWithGHN() {
        print("You choose shipping with GHN")

    }
    
    func shipWithGHTK() {
        print("You choose shipping with GHTK")

    }
    
    func shipWithNinja() {
        print("You choose shipping with Ninja Van")
    }
}

class ShopFacade {
    
    private var authenService : AuthenService
    private var purchaseServce: PurchaseService
    private var shippingService : ShippingService
    init() {
        self.authenService = AuthenService()
        self.purchaseServce = PurchaseService()
        self.shippingService = ShippingService()
    }
    
    func resetPassthenBuyClothesWithGHN() {
        authenService.resetPassword()
        purchaseServce.buyClothes()
        shippingService.shipWithGHN()
        print("Your process : reset password then buy clothes and ship with GHN is done")
    }
    
    func loginFBThenBuyDrinkFoodWithNinja() {
        authenService.logInWithFacebook(email: "nguyenthuy@gmail.com")
        purchaseServce.buyDrink()
        purchaseServce.buyFood()
        shippingService.shipWithNinja()
        print("Your process : login with Facebook, buy drink & food then ship with Ninja is done")

    }
}

let shopFacade = ShopFacade()
shopFacade.resetPassthenBuyClothesWithGHN()
