/*:
# 211. Add and Search Word - Data structure design [Medium]
  https://leetcode.com/problems/add-and-search-word-data-structure-design

 ---

### Problem Statement:

 Design a data structure that supports the following two operations:

 + `void addWord(word)`
 + `bool search(word)`

 search(word) can search a literal word or a regular expression string containing only letters `a-z` or `.`. A `.` means it can represent any one letter.




### Example:

 ```
 addWord("bad")
 addWord("dad")
 addWord("mad")
 search("pad") -> false
 search("bad") -> true
 search(".ad") -> true
 search("b..") -> true

 ```

 ### Notes:
 + You may assume that all words are consist of lowercase letters `a-z`.
 
 ### Hint:
 + You should be familiar with how a Trie works. If not, please work on this problem: [Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/) first.

 */


import UIKit

class TrieNode {
    var children = [Character: TrieNode]()
    var word: String? = nil
}

// 13 / 13 test cases passed.
// Status: Accepted
// Runtime: 624 ms
// Memory Usage: 27.4 MB

class WordDictionary {

    let root = TrieNode()
    var set = Set<String>()
    
    func addTrie(_ word: String) {
         var p = root
        
         for c in word {
             if p.children[c] == nil {
                 p.children[c] = TrieNode()
             }
             p = p.children[c]!
         }
        
        p.word = word
     }
    
    func find(_ arr: [Character], _ str: String, _ index: Int, _ node: TrieNode) -> Bool {
        
        if index == arr.count { return false }
        
        let char = arr[index]
        
        if char != "." {
            guard let child = node.children[char] else {
                return false
            }
            
            if let word = child.word, word.count == arr.count, index == arr.count - 1 {
                return true
            }
            
            if find(arr, str, index+1, child) {
                return true
            }
            
        } else {
            for item in node.children {
                let child = item.value
                
                if let word = child.word, word.count == arr.count, index == arr.count - 1 {
                    return true
                }

                if find(arr, str, index+1, child) {
                    return true
                }
            }
        }
        
        return false
    }

    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        addTrie(word)
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        if set.contains(word) { return true }
        let arr = Array(word)
        let res = find(arr, word, 0, root)
        if res == true {
            set.insert(word)
        }
        return res
    }
}


class WordDictionary2 {
    var wordSet: Set<String>
    var charCountMap: [Int: [[Character]]]
    
    /** Initialize your data structure here. */
    init() {
        wordSet = []
        charCountMap = [:]
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        wordSet.insert(word)
        charCountMap[word.count, default: []].append(Array(word))
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        if wordSet.contains(word) {
            return true
        }
        let word = Array(word)
        if let options = charCountMap[word.count] {
            optionLoop: for option in options {
                for i in 0..<word.count {
                    if option[i] != word[i] && word[i] != Character(".") {
                      continue optionLoop
                    }
                }
                return true
            }
        }
        return false
    }
}


// Your WordDictionary object will be instantiated and called as such:

let obj = WordDictionary()
obj.addWord("bad")
obj.addWord("dad")
obj.addWord("mad")
obj.search("pad") // false
obj.search("bad") // true
obj.search(".ad") // true
obj.search("b..") // true


