/*:
 # Design HashSet
 https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3410/
 
 ---
 
 ### Problem Statement:
 
 Design a HashSet without using any built-in hash table libraries.
 
 To be specific, your design should include these functions:
 
 + `add(value)`: Insert a value into the HashSet.
 + `contains(value) `: Return whether the value exists in the HashSet or not.
 + `remove(value)`: Remove a value in the HashSet. If the value does not exist in the HashSet, do nothing.
 
 ### Example:
 
 ```
 MyHashSet hashSet = new MyHashSet();
 hashSet.add(1);
 hashSet.add(2);
 hashSet.contains(1);    // returns true
 hashSet.contains(3);    // returns false (not found)
 hashSet.add(2);
 hashSet.contains(2);    // returns true
 hashSet.remove(2);
 hashSet.contains(2);    // returns false (already removed)
 
 ```
 
 ### Notes:
 + All values will be in the range of `[0, 1000000]`.
 + The number of operations will be in the range of `[1, 10000]`.
 + Please do not use the built-in HashSet library.
 
 */


import UIKit


// 28 / 28 test cases passed.
// Status: Accepted
// Runtime: 396 ms
// Memory Usage: 22.2 MB

class MyHashSet {
    
    /** Initialize your data structure here. */
    private var maxSize = 1000
    private var table = [[Int]]()
    
    private func hash(_ key: Int) -> Int {
        return key % maxSize
    }
        
    init() {
        table = Array(repeating: [Int](), count: maxSize)
    }
    
    func add(_ key: Int) {
        guard !contains(key) else {
            return
        }
        
        table[hash(key)].append(key)
    }
    
    func remove(_ key: Int) {
        guard contains(key) else {
            return
        }
        
        table[hash(key)].removeAll { $0 == key }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        return table[hash(key)].firstIndex(of: key) != nil
        
    }
}


// Your MyHashSet object will be instantiated and called as such:

let obj = MyHashSet()
obj.add(1)
obj.add(2)
obj.add(3)
obj.remove(2)

let ret_1: Bool = obj.contains(1)
let ret_2: Bool = obj.contains(2)
let ret_3: Bool = obj.contains(3)


