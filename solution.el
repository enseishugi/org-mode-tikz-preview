# GNU Emacs 26.3
# Org package version 20191118 (downloaded from https://orgmode.org/elpa/ repository)

# This adds
(add-to-list 'org-preview-latex-process-alist '(graphicsmagick :programs ("latex" "gm")
                                                                 :description "pdf > png"
                                                                 :message "you need to install the programs: latex and graphicsmagick"
                                                                 :use-xcolor t
                                                                 :image-input-type "pdf"
                                                                 :image-output-type "png"
                                                                 :image-size-adjust (1.0 . 1.0)
                                                                 :latex-compiler ("pdflatex -interaction nonstopmode -output-directory %o %f")
                                                                 :image-converter ("gm convert -density %D -trim -antialias -quality 100 %f %O")))
