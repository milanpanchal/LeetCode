/*:
# Delete Node in a Linked List
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3348/

 ---

### Problem Statement:

 Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.

 Given linked list -- head = [4,5,1,9], which looks like following:



### Example:

 ```
 Input: head = [4,5,1,9], node = 5
 Output: [4,1,9]
 Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.

 
 Input: head = [4,5,1,9], node = 1
 Output: [4,5,9]
 Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.

 
 ```

 ### Notes:
 + The linked list will have at least two elements.
 + The linked list will have at least two elements.
 + The given node will not be the tail and it will always be a valid node of the linked list.
 + Do not return anything from your function.

 
 */

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    void deleteNode(ListNode* node) {
        ListNode * toDel = node->next;
        *node = *(node->next);
        delete toDel;
    }
};