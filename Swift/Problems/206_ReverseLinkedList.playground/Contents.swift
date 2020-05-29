/*:
# 206. Reverse Linked List
  https://leetcode.com/problems/reverse-linked-list/
 
 ---

### Problem Statement:

 Reverse a singly linked list.

### Example:

 ```
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 ```

 ### Notes:
 + A linked list can be reversed either iteratively or recursively. Could you implement both?
 
 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}

class Solution {
    func printNodeValues(_ head: ListNode?) {
        var node = head
        while node != nil {
            print(node!.val, terminator: "->")
            node = node!.next
        }
        print("")
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {

        if head == nil || head?.next == nil { return head }
        
        var currentNode = head
        var nextNode:ListNode?
        var previousNode:ListNode?
        
        while currentNode != nil {
            nextNode = currentNode?.next
            currentNode?.next = previousNode
            
            previousNode = currentNode
            currentNode = nextNode
        }
        //currentNode = previousNode
        //return currentNode
        return previousNode
    }
}

let node = ListNode(1)
node.next = ListNode(3)
node.next?.next = ListNode(5)
node.next?.next?.next = ListNode(7)
node.next?.next?.next?.next = ListNode(9)

let obj = Solution()
obj.printNodeValues(node)
let reverseNode = obj.reverseList(node)
obj.printNodeValues(reverseNode)
