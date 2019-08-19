# LLRBTrees

[![Build Status](https://travis-ci.org/epaaso/LLRBTrees.jl.svg?branch=master)](https://travis-ci.org/epaaso/LLRBTrees.jl)
[![codecov.io](https://codecov.io/github/epaaso/LLRBTrees.jl/coverage.svg?branch=master)](https://codecov.io/github/epaaso/LLRBTrees.jl?branch=master)

a


Translated from Robert Sedgewicks original

A Red-Black Tree structure is an object for accessing ordered-associative arrays in at most 2 log<sub>2</sub>N steps. Where N is the number of elements in the array.

Experimentally, this particular design requires on average log<sub>2</sub>N - 0.5 steps for a successful search.

## Installation

To install run the code:

```julia
    Pkg.clone("github.com/epaaso/LLRBTrees.jl")
```

## Instantiation

A tree object can be instantiated specifying the types for key and value:

```julia
    tree = LLRBTree{Int, ASCIIString}()
```

Or by specifying the values of the root:

```julia
    tree = LLRBTree(1,"a")
```

The tree `LLRBTree` is built of `TreeNode`s that are built the same way.

## Manipulation

For indexing, addition and deletion, the methods from `Base` have been adopted:

```julia
tree = LLRBTree(1,"a")
push!(tree, 2, "b")
push!(tree, 3, "c")

    b       
/       \  
a        c     


delete!(tree, 1)

    c       
/           
b_r  


tree[2]

Nullable("b")

tree[2]="now"

    c       
/            
now_r     
```

In addition to that, there is a method to return an ordered list from the elements in the tree:

```julia
ordereredpairs(tree)

4-element Array{Any,1}:
 [5,5]  
 [6,6]  
 [10,10]
 [15,15]

```

## Visualization
There is also a separate module, that uses a slight modification of [GraphViz.jl](https://github.com/Keno/GraphViz.jl)
to make a graph plot of the trees. It can be found in https://github.com/epaaso/LLRBVisualize.jl.

## Acknowledgements
Many thanks to David P. Sanders, researcher at UNAM, for tutoring this project.
Also to Erik Jimenez for also translating the code.

## Bibliography
* Sedgewick, R. (2008, April). Left-leaning red-black trees. In Dagstuhl Workshop on Data Structures (p. 17).
* Robert Sedgewick; Kevin Wayne (21 February 2011). Algorithms. Addison-Wesley Professional. ISBN 978-0-13-276256-4.
