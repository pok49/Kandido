k = ~/Documents/Books/fb2pdf-j.20180924
# hy = $(k)/pok/hy
hy = /home/sergio/Documents/Books/fb2pdf-j.20180924/pok/hy
#huj = $(hy)/itext-hyph-xml.jar
huj = /home/sergio/Documents/Books/fb2pdf-j.20180924/pok/hy/itext-hyph-xml.jar
fb2lint = /usr/bin/xmllint --noout --schema /home/sergio/Dropbox/Books/fb2-spec/trunk/fb2-perl-tools/XSD/FB2.1/FictionBook2.1.xsd

fb:	K.fb2
kz:	Kandido.fb2.zip

pdf:	Sup.pdf
LS:	Supl2022.pdf


K.fb2:	Kandido.fb2
	sed -e '/PDF:/,/FDP/d; /FB2:/d; /--2BF--/d' Kandido.fb2 > K.fb2
	$(fb2lint) K.fb2
Kandido.fb2.zip:	K.fb2
	rm -f Kandido.fb2.zip; zip -9 Kandido.fb2.zip K.fb2

hyp: /home/sergio/Documents/Books/fb2pdf-j.20180924/pok/hy/itext-hyph-xml.jar

# $(hyj):	$(hy)/eo.xml
/home/sergio/Documents/Books/fb2pdf-j.20180924/pok/hy/itext-hyph-xml.jar:	/home/sergio/Documents/Books/fb2pdf-j.20180924/pok/hy/com/itextpdf/text/pdf/hyphenation/hyph/eo.xml
	cd $(hy) && zip -fr itext-hyph-xml.jar *

# Sup.pdf:	ka.fb2 /home/sergio/Documents/Books/fb2pdf-j.20180924/pok/hy/itext-hyph-xml.jar /home/sergio/Documents/Books/fb2pdf-j.20180924/data/stylesheet.json
Sup.pdf:	ka.fb2 /home/sergio/Documents/Books/fb2pdf-j.20180924/pok/hy/itext-hyph-xml.jar stylesheet-sezonoj.json
	$(fb2lint) ka.fb2
	$(k)/fb2pdf.sh ka.fb2 -e utf8 -s stylesheet-sezonoj.json -o Sup.pdf

ka.fb2:	Kandido.fb2
	sed -Ef fb2.sed Kandido.fb2 > ka.fb2

opt:	Supl2022.pso.pdf

Supl2022.pso.pdf: Supl2022.pdf
	/home/sergio/Tools/pdfsizeopt/pdfsizeopt.single Supl2022.pdf
Supl2022.pdf:	Sup.pdf	Supl0.pdf
#	pdftk A=Supl0.pdf B=Sup.pdf cat A1-3 B3-4 B6-174 A175-176 output Supl2022.pdf
	pdftk A=Supl0.pdf B=Sup.pdf cat A1-3 B3-4 B6-174 output Supl2022.pdf
