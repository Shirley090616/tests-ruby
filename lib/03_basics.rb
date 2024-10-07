# Cette fonction détermine quel est le plus grand nombre parmi les trois donnés.
def who_is_bigger(a, b, c)
    return "nil detected" if [a, b, c].include?(nil)  # Vérifie si un des arguments est nil
    if a > b && a > c
      "a is bigger"  # Modifiez ici pour correspondre à l'anglais
    elsif b > a && b > c
      "b is bigger"  # Modifiez ici pour correspondre à l'anglais
    else
      "c is bigger"  # Modifiez ici pour correspondre à l'anglais
    end
  end
  
  # Cette fonction renverse une chaîne, la met en majuscules et supprime les lettres L, T et A.
  def reverse_upcase_noLTA(str)
    str.upcase.reverse.delete("LTA")
  end
  
  # Cette fonction vérifie si le nombre 42 est présent dans le tableau.
  def array_42(arr)
    arr.include?(42)
  end
  
  # Cette fonction modifie un tableau de nombres selon les spécifications données.
  def magic_array(arr)
    arr.flatten           # Aplatir le tableau
       .map { |n| n * 2 } # Multiplier chaque nombre par 2
       .reject { |n| n % 3 == 0 } # Supprimer les multiples de 3
       .uniq              # Enlever les doublons
       .sort              # Trier le tableau
  end
  
  # Début des tests
  describe 'quel est le plus grand nombre' do
    # Indice : 'def who_is_bigger(a, b, c)'
    it 'me dit quel est le plus grand' do
      expect(who_is_bigger(84, 42, nil)).to eq("nil detected")  # Vérifiez la langue ici
      expect(who_is_bigger(nil, 42, 21)).to eq("nil detected")  # Vérifiez la langue ici
      expect(who_is_bigger(84, 42, 21)).to eq("a is bigger")     # Vérifiez la langue ici
      expect(who_is_bigger(42, 84, 21)).to eq("b is bigger")     # Vérifiez la langue ici
      expect(who_is_bigger(42, 21, 84)).to eq("c is bigger")     # Vérifiez la langue ici
    end
  end
  
  describe 'modifications folles sur les chaînes' do
    # Renverser, mettre en majuscule puis supprimer toutes les lettres L, T et A.
    # Indice : cherche "ruby string" sur Google
    it 'fait des modifications folles sur les chaînes' do
      expect(reverse_upcase_noLTA("Tries this at Home, Kids"))
        .to eq("SDIK ,EMOH  SIH SEIR")
      expect(reverse_upcase_noLTA("Ponies loves carrots"))
        .to eq("SORRC SEVO SEINOP")
      expect(reverse_upcase_noLTA("qwertyuiopasdfghjkl;zxcvbn"))
        .to eq("NBVCXZ;KJHGFDSPOIUYREWQ")
    end
  end
  
  describe 'chercheur de 42' do
    # array_42 prend un tableau en paramètre et retourne :
    # - vrai s'il y a un 42 dans le tableau
    # - faux sinon
    # Indice : Cela devrait tenir en 2 lignes (ou même 1 :)
    # Indice : cherche "ruby array each" sur Google
    it 'trouve 42' do
      expect(array_42([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])).to eq false
      expect(array_42([1, 2, 3, 4, 5, 6, 7, 8, 9, 42, 21, 10.5])).to eq true
    end
  end
  
  describe 'modifications folles sur les tableaux' do
    # La fonction magic_array prend un tableau de nombres ou un tableau
    # de tableaux de nombres en paramètre et retourne le même tableau :
    # - aplati (c'est-à-dire sans sous-tableaux)
    # - trié
    # - avec chaque nombre multiplié par 2
    # - avec chaque multiple de 3 supprimé
    # - sans doublon (chaque nombre ne doit apparaître qu'une seule fois)
    # - trié
    # BONUS : Vous pouvez faire cela en une ligne de moins de 55 caractères
    it 'fait des modifications folles sur les tableaux' do
      expect(magic_array([1, 2, 3, 4, 5, 6]))
        .to eq([2, 4, 8, 10])
      expect(magic_array([1, [2, 3], 4, 5, 6, 23, 31, [1, 2, 3]]))
        .to eq([2, 4, 8, 10, 46, 62])
      expect(magic_array([[32, 54], [48, 12], [21, [1, 2, [3]]], 7, 8]))
        .to eq([2, 4, 14, 16, 64])
    end
  end
  