/*:
# 1286. Iterator for Combination [Medium]
  https://leetcode.com/problems/iterator-for-combination/

 ---

### Problem Statement:

 Design an Iterator class, which has:
 + A constructor that takes a string `characters` of sorted distinct lowercase English letters and a number `combinationLength` as arguments.
 + A function next() that returns the next combination of length `combinationLength` in lexicographical order.
 + A function `hasNext()` that returns `True` if and only if there exists a next combination.


### Example:

 ```
 CombinationIterator iterator = new CombinationIterator("abc", 2); // creates the iterator.

 iterator.next(); // returns "ab"
 iterator.hasNext(); // returns true
 iterator.next(); // returns "ac"
 iterator.hasNext(); // returns true
 iterator.next(); // returns "bc"
 iterator.hasNext(); // returns false

 ```
 
 ### Constraints:
 + 1 <= combinationLength <= characters.length <= 15
 + There will be at most 10^4 function calls per test.
 + It's guaranteed that all calls of the function next are valid.


 ### Hint:
 + Generate all combinations as a preprocessing.
 + Use bit masking to generate all the combinations.

 */

import UIKit


// 16 / 16 test cases passed.
// Status: Accepted
// Runtime: 68 ms
// Memory Usage: 21.8 MB

class CombinationIterator {

    private var queue = [String]()
    
    init(_ characters: String, _ combinationLength: Int) {
        generateCombinations(Array(characters), combinationLength, 0, "")
    }
    
    func next() -> String {
        return queue.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !queue.isEmpty
    }
    
    private func generateCombinations(_ characters: [Character], _ len: Int, _ index: Int, _ temp: String) {
        if temp.count == len {
            queue.append(temp)
            return
        }
        
        for i in index..<characters.count {
            generateCombinations(characters, len, i + 1, temp + String(characters[i]))
        }
    }
          
}

// Your CombinationIterator object will be instantiated and called as such:
let obj = CombinationIterator("abc", 2)
let ret_1: String = obj.next() // ab
let ret_2: Bool = obj.hasNext() // true
let ret_3: String = obj.next() // ac
let ret_4: Bool = obj.hasNext() // true
let ret_5: String = obj.next() // bc
let ret_6: Bool = obj.hasNext() // false


