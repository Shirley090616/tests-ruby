require_relative '../lib/01_temperature' # Charge le fichier 01_temperature.rb
#°C=(°F-32)*5/9 # formule sur google pour convertion °F en °C
describe "fonctions de conversion de température" do # Décrit un groupe de tests pour les fonctions de
    #conversion de température

  describe "#ftoc" do # Décrit le test pour la fonction de conversion 
  #Fahrenheit vers Celsius

    it "convertit la température de congélation" do # Teste la conversion de la température de congélation
      expect(ftoc(32)).to eq(0) # Vérifie que 32°F est égal à 0°C
    end

    it "convertit la température d'ébullition" do # Teste la conversion de la température d'ébullition
      expect(ftoc(212)).to eq(100) # Vérifie que 212°F est égal à 100°C
    end

    it "convertit la température du corps" do # Teste la conversion de la température du corps
      expect(ftoc(98.6)).to eq(37) # Vérifie que 98.6°F est égal à 37°C
    end

    it "convertit une température arbitraire" do # Teste la conversion d'une température arbitraire
      expect(ftoc(68)).to eq(20) # Vérifie que 68°F est égal à 20°C
    end

  end

  describe "#ctof" do # Décrit le test pour la fonction de conversion Celsius vers Fahrenheit

    it "convertit la température de congélation" do # Teste la conversion de la température de congélation
      expect(ctof(0)).to eq(32) # Vérifie que 0°C est égal à 32°F
    end

    it "convertit la température d'ébullition" do # Teste la conversion de la température d'ébullition
      expect(ctof(100)).to eq(212) # Vérifie que 100°C est égal à 212°F
    end

    it "convertit une température arbitraire" do # Teste la conversion d'une température arbitraire
      expect(ctof(20)).to eq(68) # Vérifie que 20°C est égal à 68°F
    end

    it "convertit la température du corps" do # Teste la conversion de la température du corps
      expect(ctof(37)).to be_within(0.1).of(98.6) # Vérifie que 37°C est proche de 98.6°F à une marge de 0.1
      # Pourquoi avons-nous besoin d'utiliser be_within ?
      # Voir http://www.ruby-forum.com/topic/169330
      # et http://en.wikipedia.org/wiki/IEEE_754-2008
      # et http://en.wikipedia.org/wiki/Double_precision_floating-point_format
      # Essayez aussi "puts 0.5 - 0.4 - 0.1" -- assez fou, n'est-ce pas ?
    end

  end
.....................................................................................
require_relative '../lib/02_calculator'

describe "addition" do
  it "additionne 0 et 0" do
    expect(add(0, 0)).to eq(0)
  end

  it "additionne 2 et 2" do
    expect(add(2, 2)).to eq(4)
  end

  it "additionne des nombres positifs" do
    expect(add(2, 6)).to eq(8)
  end
end

describe "soustraction" do
  it "soustrait des nombres" do
    expect(subtract(10, 4)).to eq(6)
  end
end

describe "somme" do
  it "calcule la somme d'un tableau vide" do
    expect(sum([])).to eq(0)
  end

  it "calcule la somme d'un tableau contenant un nombre" do
    expect(sum([7])).to eq(7)
  end

  it "calcule la somme d'un tableau de deux nombres" do
    expect(sum([7, 11])).to eq(18)
  end

  it "calcule la somme d'un tableau de plusieurs nombres" do
    expect(sum([1, 3, 5, 7, 9])).to eq(25)
  end
end

# Écrivons quelques tests !
# Nous allons te montrer le premier, tu écriras les autres :)

describe "#multiplier" do

  it "multiplie deux nombres" do
    expect(multiply(3, 4)).to eq(12)
  end

  it "multiplie deux autres nombres" do
    expect(multiply(5, 6)).to eq(30)  # un autre test ici, n'oublie pas do end ;)
  end

  it "multiplie deux autres nombres, dont l'un est 0" do
    expect(multiply(0, 10)).to eq(0)  # un dernier test, avec 0 dedans
  end

end

describe "#puissance" do
  it "élève un nombre à la puissance d'un autre nombre" do
    expect(power(2, 3)).to eq(8)  # ajout d'un test d'exemple
  end
end

# http://fr.wikipedia.org/wiki/Factorielle
describe "#factorielle" do
  it "calcule la factorielle de 0" do
    expect(factorial(0)).to eq(1)
  end

  it "calcule la factorielle de 1" do
    expect(factorial(1)).to eq(1)
  end

  it "calcule la factorielle de 2" do
    expect(factorial(2)).to eq(2)
  end

  it "calcule la factorielle de 5" do
    expect(factorial(5)).to eq(120)
  end

  it "calcule la factorielle de 10" do
    expect(factorial(10)).to eq(3628800)
  end
end
....................................................................................
require_relative '../lib/03_basics'

....................................................................................
describe "Simon dit" do
    describe "écho" do
      it "devrait écho hello" do
        expect(echo("hello")).to eq("hello")
      end
  
      it "devrait écho bye" do
        expect(echo("bye")).to eq("bye")
      end
    end
  
    describe "crier" do
      it "devrait crier hello" do
        expect(shout("hello")).to eq("HELLO")
      end
  
      it "devrait crier plusieurs mots" do
        expect(shout("hello world")).to eq("HELLO WORLD")
      end
    end
  
    describe "répéter" do
      it "devrait répéter" do
        expect(repeat("hello")).to eq("hello hello")
      end
  
      # Attends une seconde ! Comment peux-tu faire en sorte que la méthode "répéter"
      # prenne un *ou* deux arguments ?
      #
      # Indice : *valeurs par défaut* https://www.skorks.com/2009/08/method-arguments-in-ruby/
      it "devrait répéter un certain nombre de fois" do
        expect(repeat("hello", 3)).to eq("hello hello hello")
      end
    end
  
    describe "début du mot" do
      it "retourne la première lettre" do
        expect(start_of_word("hello", 1)).to eq("h")
      end
  
      it "retourne les deux premières lettres" do
        expect(start_of_word("Bob", 2)).to eq("Bo")
      end
  
      it "retourne plusieurs premières lettres" do
        s = "abcdefg"
        expect(start_of_word(s, 1)).to eq("a")
        expect(start_of_word(s, 2)).to eq("ab")
        expect(start_of_word(s, 3)).to eq("abc")
      end
    end
  
    describe "premier mot" do
      it "nous dit que le premier mot de 'Hello World' est 'Hello'" do
        expect(first_word("Hello World")).to eq("Hello")
      end
  
      it "nous dit que le premier mot de 'oh dear' est 'oh'" do
        expect(first_word("oh dear")).to eq("oh")
      end
    end
  
    describe "titulariser" do
      it "met une majuscule à un mot" do
        expect(titleize("jaws")).to eq("Jaws")
      end
  
      it "met une majuscule à chaque mot (aussi appelé case titre)" do
        expect(titleize("david copperfield")).to eq("David Copperfield")
      end
  
      it "ne met pas de majuscule aux 'petits mots' dans un titre" do
        expect(titleize("war and peace")).to eq("War and Peace")
      end
  
      it "met une majuscule aux 'petits mots' au début d'un titre" do
        expect(titleize("the bridge over the river kwai")).to eq("The Bridge Over the River Kwai")
      end
    end
  end
......................................................................................
require_relative '../lib/05_timer'

describe 'chaine_temps' do
  it "devrait afficher 0 secondes sous la forme 00:00:00" do
    expect(time_string(0)).to eq("00:00:00")
  end

  it "devrait afficher 12 secondes sous la forme 00:00:12" do
    expect(time_string(12)).to eq("00:00:12")
  end

  it "devrait afficher 66 secondes sous la forme 00:01:06" do
    expect(time_string(66)).to eq("00:01:06")
  end

  it "devrait afficher 4000 secondes sous la forme 01:06:40" do
    expect(time_string(4000)).to eq("01:06:40")
  end
end
......................................................................................
require_relative '../lib/06_pig_latin'

describe "#translate" do

  it "traduit un mot commençant par une voyelle" do
    s = translate("apple")
    expect(s).to eq("appleay")
  end

  it "traduit un mot commençant par une consonne" do
    s = translate("banana")
    expect(s).to eq("ananabay")
  end

  it "traduit un mot commençant par deux consonnes" do
    s = translate("cherry")
    expect(s).to eq("errychay")
  end

  it "traduit deux mots" do
    s = translate("eat pie")
    expect(s).to eq("eatay iepay")
  end

  it "traduit un mot commençant par trois consonnes" do
    expect(translate("three")).to eq("eethray")
  end

  it "compte 'sch' comme un phonème unique" do
    s = translate("school")
    expect(s).to eq("oolschay")
  end

  it "compte 'qu' comme un phonème unique" do
    s = translate("quiet")
    expect(s).to eq("ietquay")
  end

  it "compte 'qu' comme une consonne même lorsqu'il est précédé par une consonne" do
    s = translate("square")
    expect(s).to eq("aresquay")
  end

  it "traduit de nombreux mots" do
    s = translate("the quick brown fox")
    expect(s).to eq("ethay ickquay ownbray oxfay")
  end

  # Test de bonus :
  # * écris un test affirmant que les mots en majuscules restent en majuscules (mais avec une première lettre différente, bien sûr)
  # * conserve la ponctuation de la phrase d'origine

end
......................................................................................