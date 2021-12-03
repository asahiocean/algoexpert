# [River Sizes](https://www.algoexpert.io/questions/River%20Sizes)

<div class="_2bgxjrUydJ8e-Z8lo1vpgw"><p>
  You're given a two-dimensional array (a matrix) of potentially unequal height
  and width containing only <span>0</span>s and <span>1</span>s. Each
  <span>0</span> represents land, and each <span>1</span> represents part of a
  river. A river consists of any number of <span>1</span>s that are either
  horizontally or vertically adjacent (but not diagonally adjacent). The number
  of adjacent <span>1</span>s forming a river determine its size.
</p>
<p>
  Note that a river can twist. In other words, it doesn't have to be a straight
  vertical line or a straight horizontal line; it can be L-shaped, for example.
</p>
<p>
  Write a function that returns an array of the sizes of all rivers represented
  in the input matrix. The sizes don't need to be in any particular order.
</p>
<h3>Sample Input</h3>
<pre><span class="CodeEditor-promptParameter">matrix</span> = [
  [1, 0, 0, 1, 0],
  [1, 0, 1, 0, 0],
  [0, 0, 1, 0, 1],
  [1, 0, 1, 0, 1],
  [1, 0, 1, 1, 0],
]
</pre>
<h3>Sample Output</h3>
<pre>[1, 2, 2, 2, 5] <span class="CodeEditor-promptComment">// The numbers could be ordered differently.</span>

<span class="CodeEditor-promptComment">// The rivers can be clearly seen here:</span>
<span class="CodeEditor-promptComment">// [</span>
<span class="CodeEditor-promptComment">//   [1,  ,  , 1,  ],</span>
<span class="CodeEditor-promptComment">//   [1,  , 1,  ,  ],</span>
<span class="CodeEditor-promptComment">//   [ ,  , 1,  , 1],</span>
<span class="CodeEditor-promptComment">//   [1,  , 1,  , 1],</span>
<span class="CodeEditor-promptComment">//   [1,  , 1, 1,  ],</span>
<span class="CodeEditor-promptComment">// ]</span>
</pre></div>