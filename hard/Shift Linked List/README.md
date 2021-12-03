# [Shift Linked List](https://www.algoexpert.io/questions/Shift%20Linked%20List)

<div class="_2bgxjrUydJ8e-Z8lo1vpgw"><p>
  Write a function that takes in the head of a Singly Linked List and an integer
  <span>k</span>, shifts the list in place (i.e., doesn't create a brand new
  list) by k positions, and returns its new head.
</p>
<p>
  Shifting a Linked List means moving its nodes forward or backward and wrapping
  them around the list where appropriate. For example, shifting a Linked List
  forward by one position would make its tail become the new head of the linked
  list.
</p>
<p>
  Whether nodes are moved forward or backward is determined by whether
  <span>k</span> is positive or negative.
</p>
<p>
  Each <span>LinkedList</span> node has an integer <span>value</span> as well as
  a <span>next</span> node pointing to the next node in the list or to
  <span>None</span> / <span>null</span> if it's the tail of the list.
</p>
<p>
  You can assume that the input Linked List will always have at least one node;
  in other words, the head will never be <span>None</span> / <span>null</span>.
</p>
<h3>Sample Input</h3>
<pre><span class="CodeEditor-promptParameter">head</span> = 0 -&gt; 1 -&gt; 2 -&gt; 3 -&gt; 4 -&gt; 5 <span class="CodeEditor-promptComment">// the head node with value 0</span>
<span class="CodeEditor-promptParameter">k</span> = 2
</pre>
<h3>Sample Output</h3>
<pre>4 -&gt; 5 -&gt; 0 -&gt; 1 -&gt; 2 -&gt; 3 <span class="CodeEditor-promptComment">// the new head node with value 4</span>
</pre></div>

#### Hint 1
Putting aside the cases where k is a negative integer, where k is 0, or where k is larger than the length of the linked list, what does shifting the linked list by k positions entail exactly?

#### Hint 2
Putting aside the cases mentioned in Hint #1, shifting the linked list by k positions means moving the last k nodes in the linked list to the front of the linked list. What nodes in the linked list will you actually need to mutate?

#### Hint 3
There are four nodes that really matter in this entire process: the original tail of the linked list, which will point to the original head of the linked list, the original head of the linked list, which will be pointed to by the original tail of the linked list, the new tail of the linked list, and the new head of the linked list. Note that the new head is the node that the new tail points to in the original, unshifted linked list.

#### Hint 4
You can find the original tail of the linked list by simply traversing the linked list, starting at the original head of the linked list that you're given. You can find the new tail of the linked list by moving k positions from the original tail if k is positive (which means moving to the (lengthOfList - k)th position in the list, and you can easily count the length of the list as you traverse it to find its original tail). You can access the new head of the linked list once you've found its new tail, since it's the new tail's original next node. How will you handle the trickier values of k?

#### Optimal Space & Time Complexity
O(n) time | O(1) space - where n is the number of nodes in the Linked List
