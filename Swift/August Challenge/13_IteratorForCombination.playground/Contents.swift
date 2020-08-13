/*:
# Iterator for Combination
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3422/

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


class CombinationIterator {

    init(_ characters: String, _ combinationLength: Int) {
        
    }
    
    func next() -> String {
        
    }
    
    func hasNext() -> Bool {
        
    }
}

// Your CombinationIterator object will be instantiated and called as such:
let obj = CombinationIterator("abc", 2)
let ret_1: String = obj.next() // ab
let ret_2: Bool = obj.hasNext() // true

