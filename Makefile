# MDCMD=markdown_py 
MDCMD=multimarkdown
# make sure -f is last
# MDOPTS=-f

all: index.html

index.html: header.html README.md footer.html
	cat header.html > $(@)
	$(MDCMD) $(MDOPTS) README.md >> $(@)
	cat footer.html >> $(@)

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
