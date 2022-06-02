
protocol OlderHobbitDelegate: AnyObject {
    func getAGlassOfWaterToOldHabbit()
}

class GrandfatherHobbit {
    weak var delegate: OlderHobbitDelegate?
    
    func tellAnyHobbitToGetMeSomeWater() {
        delegate?.getAGlassOfWaterToOldHabbit()
    }
}

class BadGrandson: OlderHobbitDelegate {
    func getAGlassOfWaterToOldHabbit() {
        print("Go get it yourself!")
    }
}

class GoodGrandson: OlderHobbitDelegate {
    func getAGlassOfWaterToOldHabbit() {
        print("Here is your water!")
    }
}

// The Story

let oldHobbit = GrandfatherHobbit()
let badSon = BadGrandson()
let goodSon = GoodGrandson()

oldHobbit.delegate = badSon
oldHobbit.tellAnyHobbitToGetMeSomeWater()

oldHobbit.delegate = goodSon
oldHobbit.tellAnyHobbitToGetMeSomeWater()
