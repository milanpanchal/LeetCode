/*:
# Stream of Characters
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3434/

 ---

### Problem Statement:

 Implement the `StreamChecker` class as follows:

 + `StreamChecker(words)`: Constructor, init the data structure with the given words.
 + `query(letter)`: returns true if and only if for some `k >= 1`, the last `k` characters queried (in order from oldest to newest, including this letter just queried) spell one of the words in the given list.

### Example:

 ```
 StreamChecker streamChecker = new StreamChecker(["cd","f","kl"]); // init the dictionary.
 streamChecker.query('a');          // return false
 streamChecker.query('b');          // return false
 streamChecker.query('c');          // return false
 streamChecker.query('d');          // return true, because 'cd' is in the wordlist
 streamChecker.query('e');          // return false
 streamChecker.query('f');          // return true, because 'f' is in the wordlist
 streamChecker.query('g');          // return false
 streamChecker.query('h');          // return false
 streamChecker.query('i');          // return false
 streamChecker.query('j');          // return false
 streamChecker.query('k');          // return false
 streamChecker.query('l');          // return true, because 'kl' is in the wordlist
  
 ```
 
 ### Notes:
 + 1 <= words.length <= 2000
 + 1 <= words[i].length <= 2000
 + Words will only consist of lowercase English letters
 + Queries will only consist of lowercase English letters.
 + The number of queries is at most 40000.
 
 ### Hint:
 + Put the words into a trie, and manage a set of pointers within that trie.

 */

// 17 / 17 test cases passed.
// Status: Accepted
// Runtime: 1908 ms
// Memory Usage: 31.9 MB

class Trie {
    var endOfWord: Bool = false
    var chars = [Character: Trie]()
}

class StreamChecker {
    var queryStream = [Character]()
//    var queryStream = ""
    var root: Trie
    
    init(_ words: [String]) {
        root = Trie()
        
        for word in words {
            var node = root
            for char in word.reversed() {
                if node.chars[char] == nil {
                    node.chars[char] = Trie()
                }
                node = node.chars[char]!
            }
            node.endOfWord = true
        }
    }
    
    func query(_ letter: Character) -> Bool {
        queryStream.append(letter)
//        queryStream += String(letter)
        
        var node = root
        for char in queryStream.reversed() {
            guard let next = node.chars[char] else {
                return false
            }

            if next.endOfWord {
                return true
            }
            
            node = next
        }
        
        return false
    }
}

 // Your StreamChecker object will be instantiated and called as such:

 let obj = StreamChecker(["cd","f","kl"])
 obj.query("a")
 obj.query("b")
 obj.query("c")
 obj.query("d")
 obj.query("e")
 obj.query("f")
 obj.query("g")
 obj.query("h")
 obj.query("i")
 obj.query("j")
 obj.query("k")
 obj.query("l")
