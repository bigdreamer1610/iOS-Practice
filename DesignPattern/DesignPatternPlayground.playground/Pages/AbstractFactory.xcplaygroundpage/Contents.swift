import Foundation

// defined: type of material
enum MaterialType {
    case wood
    case plastic
}

// define type of product
enum ProductType {
    case table
    case chair
}

// Abstract Product
protocol Table {
    func create()
}

protocol Chair {
    func create()
}

// Concrete product
struct WoodTable : Table {
    func create() {
        print("Wood Table is done created!")
    }
}

struct PlasticTable : Table {
    func create() {
        print("Plastic Table is done created")
    }
}

struct WoodChair : Chair {
    func create() {
        print("Wood Chair is done created")
    }
}

struct PlasticChair : Chair {
    func create() {
        print("Plastic Chair is done created")
    }
}

// Abstract Factory
protocol FurnitureFactoryProtocol {
    func createTable() -> Table
    func createChair() -> Chair
}

// Factory
struct PlasticFactory : FurnitureFactoryProtocol {
    func createTable() -> Table {
        return PlasticTable()
    }
    
    func createChair() -> Chair {
        return PlasticChair()
    }
}

struct WoodFactory : FurnitureFactoryProtocol {
    func createTable() -> Table {
        return WoodTable()
    }
    
    func createChair() -> Chair {
        return WoodChair()
    }
}

class FurnitureFactory {
    static func getFactory(type: MaterialType) -> FurnitureFactoryProtocol {
        switch type {
        case .plastic:
            return PlasticFactory()
        case .wood:
            return WoodFactory()
        }
    }
}

class Client {
    var factory: FurnitureFactoryProtocol

    init(factory: FurnitureFactoryProtocol) {
        self.factory = factory
    }
    
    func createProduct(pType: ProductType) {
        switch pType {
        case .chair:
            let chair = factory.createChair()
            chair.create()
        case .table:
            let table = factory.createTable()
            table.create()
        }
    }
}

let client = Client(factory: FurnitureFactory.getFactory(type: .wood))
client.createProduct(pType: .chair)
