(require 'elfeed)
(require 'elfeed-org)
(require 'elfeed-goodies)
(elfeed-org) ;init
(setq rmh-elfeed-org-files (list "~/Projects/localredhead.github.io/moleskin/elfeed.org.gpg"))
(elfeed-goodies/setup)
