/*:
# Odd Even Linked List
https://leetcode.com/explore/featured/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3331/

 ---

### Problem Statement:

 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.


### Example:

 ```
 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL

 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL

 ```
 
 ### Notes:
 + The relative order inside both the even and odd groups should remain as it was in the input.
 + The first node is considered odd, the second node even and so on ...
 
 */
import UIKit


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    
    func printNodeValue(_ head: ListNode?) {
        
        var node = head
        while node != nil {
            print(node!.val, terminator: "->")
            node = node?.next
        }
        print("NULL")
    }
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        if head == nil { return nil }
        if head?.next == nil { return head }

        var oddNode = head
        var evenNode = head?.next
        let evenHead = evenNode
        
        while evenNode?.next != nil {
            oddNode?.next = oddNode?.next?.next
            evenNode?.next = evenNode?.next?.next
            
            oddNode = oddNode?.next
            evenNode = evenNode?.next
        }
        
        // Linking even node at the end of odd node
        oddNode?.next = evenHead
        
        return head
    }
}

let head = ListNode(0)
head.next = ListNode(1)
head.next?.next = ListNode(2)
head.next?.next?.next = ListNode(3)
head.next?.next?.next?.next = ListNode(4)


let obj = Solution()
obj.printNodeValue(head)
let r = obj.oddEvenList(head)
print("Result")
obj.printNodeValue(r)
