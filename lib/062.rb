# Skaitļa kubs ir permutācija, ja sakārtoti cipari rezultātā sakrīt ar kāda cita
# rezultāta sakārtotiem cipariem, tāpēc var nevis veidot permutācijas, bet gan vienkārši
# salīdzināt sakārtotu rezultātu ciparus un veikt uzskaitījumu cik reizes šī kombinācija atkārtojas
@@cubes={}
@@ns={}
1.upto(10000) do |n|
  r=n**3
  r=r.to_s.split("").sort.join("")
  unless @@cubes[:"c#{r}"]
    @@cubes[:"c#{r}"]=1
    @@ns[:"c#{r}"]=[n]
  else
    @@cubes[:"c#{r}"]+=1
    @@ns[:"c#{r}"]<<n
    if @@cubes[:"c#{r}"]==5
      #puts r
      puts @@ns[:"c#{r}"].inspect
      puts @@ns[:"c#{r}"].first**3
      break;
    end
  end
end

