def colorize(text, color_code)
  "#{color_code}#{text}\e[0m"
end

def red(text); colorize(text, "\e[5;31m"); end
def green(text); colorize(text, "\e[1;4;42m"); end

puts "Przykładowy komunikat [Pozytywny]: [ " + green("ROZBROJONA") + " ]"

puts "Przykłądowy komunikat [Negatywny]: [ " + red("UCIEKAJ!!") + " ]"

puts "Czy chcesz wyświetlić tabelę ze ściągawką? [t/n]"

odp = gets.chomp.downcase

def tablica

  [0,1,4,5,7].each do |attr|
    puts "----------------------------------------------------------------"
    puts "ESC[#{attr};Kolor czcionki;Kolor tła"
    30.upto(37) do |fg|
      40.upto(47) do |bg|
        print "\033[#{attr};#{fg};#{bg}m #{fg};#{bg}  "
      end
      puts "\033[0m"
    end
  end

end

case odp

  when "t","tak","czemu nie","wyświetl"
    tablica
  when "n", "nie", "nie wyświetlaj"
    puts "nic na siłę"
  else
    puts "miałeś wybrać tak lub nie [t/n]"

end

puts "A teraz mały test."; sleep 3; puts "\rWpisz jakieś słowo: "

word = gets.chomp

puts "W porządku, może być #{word}. \n
Można w prosty sposób dodać styl do dowolnego ciągu znakóœ. \n
"; sleep 4; puts "\rWybierz styl: \e[5;31mO\e[0mstrzeżenie albo \e[42mP\e[0motwierdzenie. "

jaki_styl = gets.chomp.downcase

case jaki_styl

  when "o", "ostrzeżenie", "ostrzezenie"
    puts 100.times{|i| print "\rPrzygotowuję... #{i+1}%";
         sleep(0.1) };
         sleep 0.5;
         puts "\rTwoje słowo z dodanym stylem:  \e[5;31m#{word}\e[0m"
  when "p", "potwierdzenie"
    puts 100.times{|i| print "\rPrzygotowuję... #{i+1}%";
         sleep(0.1) };
         sleep 0.5;
         puts "\rTwoje słowo z dodanym stylem: \e[1;4;42m#{word}\e[0m"

end
