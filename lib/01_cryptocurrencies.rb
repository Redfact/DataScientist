#creer un hash table avec autant de d'élément qu'il y a de clé à insérer
#si il y a plus de valeur que de clé , ces valeurs ne seront pas insérées
def biggest_hash_values (hash , nb_values)
		big_values =hash.values.sort_by {|s| s.scan(/\d+/).first.to_i }.reverse
		puts "Voici les plus plus grandes valeurs :"
		for i in 0..nb_values-1 do
			print ">	"
			puts "#{hash.key(big_values[i])} => #{big_values[i]}"
		end
end

def smallest_hash_values (hash , nb_values)
		big_values =hash.values.sort_by {|s| s.scan(/\d+/).first.to_i }
		puts "Voici les plus petites valeurs :"
		for i in 0..nb_values-1 do
			print ">	"
			puts "#{hash.key(big_values[i])} => #{big_values[i]}"
		end
end

def Nb_of_coin array
	res =0

	array.length.times do |i|
		if( array[i].include?("coin"))then
			res+=1
		end
	end
	puts "Il y a #{res} crypto contenant coin."
return res 
end

def Crypto_inf_to(hash,value)
	keys = hash.keys
	max =0
	keymax = String.new
	puts "Les devises inférieures à #{value} dollars:"
	keys.length.times do |i|
		if( hash[keys[i]].delete('$').to_i < 6000)then
			#pour obtenir la valeur max
			if( hash[keys[i]].delete('$').to_i >max )then
			max = hash[keys[i]].delete('$').to_i
			keymax = keys[i]
			end
			print ">	"
			puts keys[i]
		end
	end
	puts "Devises la plus cher parmis celle inférieure à #{value} dollars: #{keymax} "
end

def perform
	hash = Hash.new	
	keys = ["Bitcoin", "Ethereum", "XRP", "Bitcoin Cash", "EOS", "Litecoin"]
	vals =["$6558.07", "$468.95", "$0.487526", "$762.84", "$5008.86", "$85.26", "$0.151268", "$0.206756"]
	hash = keys.zip(vals).to_h
	biggest_hash_values(hash ,3)
	smallest_hash_values(hash,3)
	Nb_of_coin hash.keys
	Crypto_inf_to(hash,6000)
end
perform