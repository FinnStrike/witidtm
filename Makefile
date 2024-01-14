# MDCMD=markdown_py 
MDCMD=multimarkdown
# make sure -f is last
# MDOPTS=-f

# Install dependencies necessary for python scripts

dependencies: install_python3 install_bs4

install_python3:
	apt-get update
	apt-get install -y python3

install_bs4:
	pip install bs4

# Create html pages from README.md

all: clean split parse format

clean:
	rm -rf pages
	rm -f index.html materials.html oldMaterials.html

split:
	python3 mdsplit.py README.md --output pages

parse: index.html materials.html oldMaterials.html

format: 
	python3 format.py

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

# Upload site pages to server (not yet implemented)

upload: index.html
	ssh down.dsg.cs.tcd.ie "(cd /var/www/witidtm;git pull)"
