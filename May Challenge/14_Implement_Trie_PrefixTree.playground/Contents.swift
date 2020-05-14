/*:
 # Implement Trie (Prefix Tree)
 https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3329/
 
 ---
 
 ### Problem Statement:
 
 Implement a trie with insert, search, and startsWith methods.
 
 
 ### Example:
 
 ```
 Trie trie = new Trie();
 
 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 
 ```
 
 ### Notes:
 + You may assume that all inputs are consist of lowercase letters a-z.
 + All inputs are guaranteed to be non-empty strings.
 
 */

class Trie {
    
    /** Initialize your data structure here. */
    
    private var hashMap = [String:Bool]()

    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        hashMap[word] = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        return hashMap[word] != nil
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return hashMap.keys.filter({ return $0.hasPrefix(prefix) }).count > 0
    }
}

let word = "apple"
let prefix = "app"
let obj = Trie()
obj.insert(word)
let ret_2: Bool = obj.search(word)
let ret_3: Bool = obj.startsWith(prefix)
