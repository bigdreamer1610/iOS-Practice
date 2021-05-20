import Foundation

// Strategy
protocol PurchaseStrategy {
    func buy()
}

// concrete strategy
struct CashMethod : PurchaseStrategy {
    func buy() {
        print("by: Cash")
    }
}

struct QRMethod : PurchaseStrategy {
    func buy() {
        print("by: QR code")
    }
}

struct BankingMethod : PurchaseStrategy {
    func buy() {
        print("by: internet banking")
    }
}

struct Customer {
    //context
    var strategy: PurchaseStrategy
    
    init(strategy: PurchaseStrategy) {
        self.strategy = strategy
    }
    
    func buyAnItem() {
        strategy.buy()
    }
}

let johny = Customer(strategy: QRMethod())
johny.buyAnItem()
