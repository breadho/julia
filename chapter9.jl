pwd()

fin = open("./data/words.txt")
words = eachline("./data/words.txt")
typeof(words)


# 연습 9-1

i = 0

for line in eachline("./data/words.txt")
    i = i + 1
    if length(line) >= 20
        println(i,": ", line)
    end
    
end



# 연습 9-2

function hasno_e(word)
    for letter in word
        if letter == 'e'
            return false
        end
    end
    true
end

i = 0
j = 0

for line in eachline("./data/words.txt")
    i = i + 1
    if hasno_e(line)
        println(i,": ", line)
        j = j + 1
    end
end

println("The ratio of hasno_e is ", round(j/i; digits = 3)*100, "%")




# 연습 9-3

function avoids(word, forbidden)
    for letter in word
        if letter ∈ forbidden
            return false
        end
    end
    true
end

i = 0
j = 0
str_forbid = "aeiou"

for line in eachline("./data/words.txt")
    i = i + 1
    if avoids(line, str_forbid )
        println(i,": ", line)
        j = j + 1
    end
end

println("The ratio of 'avoids' : ", round(j/i; digits = 3)*100, "%")
println("The counts of 'avoids' : ", j, "")




# 연습 9-4

function useonly(word, available)
    for letter in word
        if letter ∉ available
            return false
        end
    end
    true
end

i = 0
j = 0
str_accept = "acefhlo"

for line in eachline("./data/words.txt")
    i = i + 1
    if useonly(line, str_accept )
        if line != "Hoe alfalfa"
            # println(i,": ", line)
            j = j + 1
        end
    end

end

println("The ratio of 'useonly' : ", round(j/i; digits = 3)*100, "%")
println("The counts of 'useonly' : ", j, "")




# 연습 9-5 

function useall(word, required)
    for letter in required
        if letter ∉ word
            return false
        end
    end
    true
end

i = 0
j = 0
str_required = "aeiou"

for line in eachline("./data/words.txt")
    i = i + 1
    if useall(line, str_required )
        # println(i,": ", line)
        j = j + 1
    end
end

println("The ratio of 'useall' : ", round(j/i; digits = 3)*100, "%")
println("The counts of 'useall' : ", j, "")



# 연습 9-6

# for문을 이용할 경우
function isabecedarian_for(word)
    i = firstindex(word)
    previous = word[i]
    j = nextind(word,i)
    for c in word[j:end]
        if c < previous
            return false
        end
        previous = c
    end
    true
end

# 재귀문을 이용할 경우
function isabecedarian_recur(word)
    if length(word) <= 1
        return true
    end
    i = firstindex(word)
    j = nextind(word, i)

    if word[i] > word[j]
        return false
    end
    isabecedarian_recur(word[j:end])
end

# while문을 이용할 경우
function isabecedarian_while(word)
    i = firstindex(word)
    j = nextind(word, 1)

    while j <= sizeof(word)
        if word[i] > word[j]
            return false
        end

        i = j
        j = nextind(word, i)
    end
    true
end

# while문을 이용한 checking

i = 0
j = 0

for line in eachline("./data/words.txt")
    
    i = i + 1

    if isabecedarian_while(line)
        # println(i,": ", line)
        j = j + 1
    end

end

println("The ratio of 'abecedarian' : ", round(j/i; digits = 3)*100, "%")
println("The counts of 'abecedarian' : ", j, "")


isabecedarian_while("flossy")




