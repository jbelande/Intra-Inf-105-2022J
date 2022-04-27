#############Informatique pour sciences sociales 
#############Devoir d'intra
####
#### Preparer par: 
#D.John Pascal Belande        Be172850
#Marie Bermann Germain        Ge181457
#Marthe Aurore Pierre-Louis   Pi190316
#Lee-Guerlens Simon           Si191509


### La consigne fournie pour ce devoir est la realisation de graphes conforme aux exepmles fournient dans le rapport.


library('openxlsx')            #lancement du package permetant d'importer le fichier excel
test<-read.xlsx("Data.xlsx")   #importation du fichier excel
test                           #lancement du fichier excel           

#suite à l'importation et au lancement du fichier excel, nous remarquans que seulement 14 des lignes du fichier sont affichés.
#nous utilisons donc, un code afin d'afficher plus de variables, ce qui nous permettra de choisir celle qu'on veut representer. 
options(max.print=10000)       #pour afficher plus de variables
test                           #lancement du fichier excel, cette fois plus de variables sont affiché      

PIB<-test[48,7:67]             #extraction des colones 7 à 67 de la ligne 48 et son enregistrement dans un objet.
PIB                            #Lancement de l'objet
summary(PIB)                   #l'objet est constate du type caractere
PIB<-as.numeric(PIB)             #conversion du type de l'objet en numeric 
PIB

année<-test[2,7:67]            #extraction des colones 7 à 67 de la ligne 2 et son enregistrement dans un objet.
année                          #Lancement de l'objet
summary(année)                 #l'objet est constate du type caractere
année<-as.numeric(année)           #conversion du type de l'objet en numeric
année

l<-data.frame(année,PIB)       #creation d'un data frame avec les données extraites
l                              


library(tidyverse)             #lancement du package tidyverse
library(ggplot2)               #lancement du package ggplot2


ggplot(l,aes(x=année,y=PIB,colour=line))+geom_line(color="blue")+geom_smooth(col="red",se=F)+geom_vline(
  xintercept=2010,linetype="dotted",color="green",size=1.5)+geom_vline(
    xintercept=2001,linetype="dotted",color="green",size=1.5)+geom_vline(
      xintercept=1993,linetype="dotted",color="green",size=1.5)+ggtitle("Epargne brut en %du PIB")+xlab("Année")+ylab("% PIB")+annotate(
        'text', x=2010,y=5,label='Seisme',size=4,angle='90')+annotate(
          'text', x=2001,y=5,label='2001',size=4,angle='90')+annotate(
            'text', x=1993,y=5,label='1993',size=4,angle='90')+scale_shape()



#deuxieme graphe

chomage<-test[16,7:67]
chomage
chomage<-as.numeric(chomage)
chomage

vari<-data.frame(année,chomage)
vari

ggplot(l,aes(x=année,y=chomage))+geom_line(color="purple")+geom_vline(
  xintercept=2008,linetype="dotted",color="green",size=1.5)+geom_vline(
    xintercept=2019,linetype="dotted",color="green",size=1)+geom_vline(
      xintercept=2020,color="yellow",size=5)+ggtitle("Taux de chomage")+xlab("Année")+ylab("% chomage")+annotate(
        'text', x=2020,y=10,label='Covid-19',size=4,angle='90')


