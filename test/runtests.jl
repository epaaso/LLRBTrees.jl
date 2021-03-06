using LLRBTrees
using FactCheck



include("randomscenarios.jl")


facts("Inflate and deflate 5 elements") do

    tree = LLRBTree{Int, ASCIIString}()
    push!(tree, 1, "a")
    push!(tree, 2, "b")
    push!(tree, 3, "c")
    push!(tree, 4, "d")
    push!(tree, 5, "e")

    context("Integrity") do
        @fact tree --> check_height "Not balanced"
        @fact getmaxdepth(tree) == 3 --> true "Max depth does not match"
        @fact maximum(tree).key.value == 5 --> true "Maximun does not match"

        listed = orderedpairs(tree)
        i=1
        flag = true
        for pair = listed
            flag = pair[1] == i ? flag : false
            i += 1
        end
        @fact flag --> true "Didn't order correctly"
    end

    context("Structure") do

        flag = true
        i = 1
        for letter = ["a","b","c","d","e"]
            flag = letter == tree[i].value ? flag : false
            i+=1
        end
        @fact flag --> true "Values do not correspond to keys"

        tree[1]="z"
        @fact tree[1].value == "z" --> true "Didn't assign new value to key 1"
        tree[1]="a"
        @fact tree[1].value == "a" --> true "Didn't assign new value to key 1"

        flag = true
        for i in 1:5
            flag = haskey(tree, i) ? flag : false
        end
        @fact flag --> true "All keys are present"


        @fact tree.root.left.key.value == 2 --> true "Tree structure differs from expected in inflation"
        @fact tree.root.right.key.value == 5 --> true "Tree structure differs from expected in inflation"
        @fact tree.root.left.right.key.value == 3 --> true "Tree structure differs from expected in inflation"
        @fact tree.root.left.left.key.value == 1 --> true "Tree structure differs from expected in inflation"
    end

    context("Deflation") do
        delete!(tree,2)
        @fact tree.root.left.left.key.value == 1 --> true "Tree structure differs from expected in deflation"

        delete!(tree, 4)
        @fact tree.root.isRed --> false "Tree structure differs from expected in deflation"

        delete!(tree, 1)
        delete!(tree, 3)
        delete!(tree, 5)
        @fact isleaf(tree.root) --> true "Tree wasn't empty at the end of deflation"
    end
end

randomscenarios()



FactCheck.exitstatus()
