# MDCMD=markdown_py 
MDCMD=multimarkdown
# make sure -f is last
# MDOPTS=-f

all: clean split parse

clean:
	rm -rf pages
	rm -f index.html materials.html oldMaterials.html

split:
	mdsplit README.md --output pages

parse: index.html materials.html oldMaterials.html

index.html: headers/header-home.html pages/What\ is\ the\ Internet\ doing\ to\ me\ witidtm.md headers/footer.html
	cat headers/header-home.html > $@
	multimarkdown pages/What\ is\ the\ Internet\ doing\ to\ me\ witidtm.md >> $@
	cat headers/footer.html >> $@

materials.html: headers/header-materials.html pages/Materials.md headers/footer.html
	cat headers/header-materials.html > $@
	multimarkdown pages/Materials.md >> $@
	cat headers/footer.html >> $@

oldMaterials.html: headers/header-oldmaterials.html pages/Old\ lecture\ slides.md headers/footer.html
	cat headers/header-oldmaterials.html > $@
	multimarkdown pages/Old\ lecture\ slides.md >> $@
	cat headers/footer.html >> $@

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
