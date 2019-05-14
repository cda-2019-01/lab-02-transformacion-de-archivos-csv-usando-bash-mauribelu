#lectura de los archivos
import glob

filenames = glob.glob('lab-02/*.csv')
filenames

#se leen cada uno de los archivos para ver su estructura
text1 = []
for filename in filenames:
    with open('lab-02/estacion1.csv', 'rt') as f1:
        text1 = f1.readlines()
text1 [:5]

text2 = []
for filename in filenames:
    with open('lab-02/estacion2.csv', 'rt') as f2:
        text2 = f2.readlines()
text2 [:5]

text3 = []
for filename in filenames:
    with open('lab-02/estacion3.csv', 'rt') as f3:
        text3 = f3.readlines()
text3 [:5]

text4 = []
for filename in filenames:
    with open('lab-02/estacion4.csv', 'rt') as f4:
        text4 = f4.readlines()
text4 [:5]

#Decimales 
text1 = [line.replace(',', '.') for line in text1]
text2 = [line.replace(',', '.') for line in text2]
text3 = [line.replace(',', '.') for line in text3]
text4 = [line.replace(',', '.') for line in text4]

#se elimina el retorno de carro '\n'
text1 = [line[:-1] for line in text1]
text2 = [line[:-1] for line in text2]
text3 = [line[:-1] for line in text3]
text4 = [line[:-1] for line in text4]


## Se separan los campos deliminados por comas
text1 = [line.replace(';', ',') for line in text1]
text2 = [line.replace(';', ',') for line in text2]
text3 = [line.replace(';', ',') for line in text3]
text4 = [line.replace(';', ',') for line in text4]


