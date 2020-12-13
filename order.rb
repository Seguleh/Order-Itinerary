tks = [['FRA', 'SXF'],['SXF', 'SFO'],['OPO', 'FRA'],['LIS','OPO']]

puts "Unordered list of flights:"
puts tks.inspect

# Lets get the origins and destinations
origs = tks.map{|x| x[0]}
dests = tks.map{|x| x[1]}

# Was named "find_origin" but starting it realized the order would determine if you either want origin or destination so made a resuable function to find "it"
def find_it(a, b)
    a.each do |x|
        if(!(b.include?(x)))
            return x
        end
    end
    return "There is none"
end

# Save origin
ori = find_it(origs, dests)

# exit if there is no origin
if ori == "There is none"
    exit
end

# Get origin ticket
s = tks.select{|x| x[0] == ori}

# Lets remove the origin from the unordered list since we already found it and its in our hand ;)
tks.delete(s[0])

# Lets go through the unordered tickets until there is none
i = 0
until tks.empty? do
    f = tks.select{|x| x[0] == s[i][1]}
    s.push(f[0])
    tks.delete(f[0])
    i += 1
end

puts "Flight itinerary:"
puts s.inspect