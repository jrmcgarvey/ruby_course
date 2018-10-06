def substrings(s,dictionary)
    s1 = s.downcase
    found={}
    dictionary.each do |word|
        if s1.include? word
            a=s1.scan(word)
            found[word]=a.length
        end 
    end
    return found
end
        
Dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]        
    
puts substrings("Howdy partner, sit down! How's it going?",Dictionary)