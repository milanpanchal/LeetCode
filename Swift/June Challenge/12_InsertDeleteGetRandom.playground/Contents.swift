/*:
# Insert Delete GetRandom O(1)
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3358/

 ---

### Problem Statement:

 Design a data structure that supports all following operations in average O(1) time.
 1.  insert(val): Inserts an item val to the set if not already present.
 2. remove(val): Removes an item val from the set if present.
 3. getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.

### Example:

 ```
 // Init an empty set.
 RandomizedSet randomSet = new RandomizedSet();

 // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomSet.insert(1);

 // Returns false as 2 does not exist in the set.
 randomSet.remove(2);

 // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomSet.insert(2);

 // getRandom should return either 1 or 2 randomly.
 randomSet.getRandom();

 // Removes 1 from the set, returns true. Set now contains [2].
 randomSet.remove(1);

 // 2 was already in the set, so return false.
 randomSet.insert(2);

 // Since 2 is the only number in the set, getRandom always return 2.
 randomSet.getRandom();

 ```
 
 */
import UIKit

class RandomizedSet {

    var hashMap:[Int:Bool]
    
    /** Initialize your data structure here. */
    init() {
        hashMap = [:]
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if hashMap[val] == nil {
            hashMap[val] = true
            return true
        }
        return false
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if hashMap[val] != nil {
            hashMap[val] = nil
            return true
        }
        return false
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return hashMap.keys.randomElement() ?? 0
    }
}


// Your RandomizedSet object will be instantiated and called as such:
let obj = RandomizedSet()
//let ret_1: Bool = obj.insert(1) // true
//let ret_2: Bool = obj.remove(2) // false
//let ret_3: Bool = obj.insert(2) // true
//let ret_4: Int = obj.getRandom() // 1 or 2
//let ret_5: Bool = obj.remove(1) // true
//let ret_6: Bool = obj.insert(2) // false
let ret_7: Int = obj.getRandom() // 2


["RandomizedSet","insert","remove","insert","getRandom","remove","insert","getRandom"]
[[],[1],[2],[2],[],[1],[2],[]]
