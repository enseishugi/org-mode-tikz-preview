;; GNU Emacs 26.3
;; Org package version 20191118 (downloaded from https://orgmode.org/elpa/ repository)

;; Copy paste into your init file from line 6. Make sure org package is loaded before executing this.

;; This command creates a 'graphicsmagick' process and adds it to 'org-preview-latex-process-alist'.
;; It compiles the .tex file with pdflatex, then creates the .png image from the .pdf file with GraphicsMagicks. 
(add-to-list 'org-preview-latex-process-alist '(graphicsmagick :programs ("latex" "gm")
                                                               :description "pdf > png"
                                                               :message "you need to install the programs: latex and graphicsmagick"
                                                               :use-xcolor t
                                                               :image-input-type "pdf"
                                                               :image-output-type "png"
                                                               :image-size-adjust (1.0 . 1.0)
                                                               :latex-compiler ("pdflatex -interaction nonstopmode -output-directory %o %f")
                                                               :image-converter ("gm convert -density %D -trim -antialias -quality 100 %f %O")))

;; This command sets 'graphicsmagick' process for LaTeX previews in org-mode.
(setq org-preview-latex-default-process 'graphicsmagick)
