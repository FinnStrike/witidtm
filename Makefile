# MDCMD=markdown_py 
MDCMD=multimarkdown
# make sure -f is last
# MDOPTS=-f

all: index.html split parse

split:
	mdsplit README.md --output pages

parse: home.html materials.html oldMaterials.html

clean:
	rm -rf pages
	rm -f index.html home.html materials.html oldMaterials.html

index.html: header.html README.md footer.html
	cat header.html > $@
	multimarkdown README.md >> $@
	cat footer.html >> $@

home.html: header.html pages/What\ is\ the\ Internet\ doing\ to\ me\ witidtm.md footer.html
	cat header.html > $@
	multimarkdown pages/What\ is\ the\ Internet\ doing\ to\ me\ witidtm.md >> $@
	cat footer.html >> $@

materials.html: header.html pages/Materials.md footer.html
	cat header.html > $@
	multimarkdown pages/Materials.md >> $@
	cat footer.html >> $@

oldMaterials.html: header.html pages/Old\ lecture\ slides.md footer.html
	cat header.html > $@
	multimarkdown pages/Old\ lecture\ slides.md >> $@
	cat footer.html >> $@

lectures/2022-2023/index.html: lectures/2022-2023/README.md
	$(MDCMD) $(MDOPTS) $(<) > $(@) 

lectures/2021-2022/index.html: lectures/2021-2022/README.md
	$(MDCMD) $(MDOPTS) $(<) > $(@) 

lectures/2020-2021/index.html: lectures/2020-2021/README.md
	$(MDCMD) $(MDOPTS) $(<) > $(@) 

lectures/2019-2020/index.html: lectures/2019-2020/README.md
	$(MDCMD) $(MDOPTS) $(<) > $(@) 

#upload: index.html
#	ssh down.dsg.cs.tcd.ie "(cd /var/www/witidtm;git pull)"
