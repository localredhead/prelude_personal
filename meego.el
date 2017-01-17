(require 'ego)
(ego-add-to-alist 'ego-project-config-alist
                  '(("localredhead"
                     :repository-directory "~/Projects/localredhead.github.io"
                     :repository-org-branch "source" ;
                     :repository-html-branch "master" ;
                     :site-domain "https://localredhead.github.io"
                     :site-main-title "L. Strope"
                     :site-sub-title "entropy in action"
                     :theme (dracula)
                     :summary (("years" :year :updates 50) ("tags" :tags))
                     :default-category "blog"
                     :about ("About me" "/about/")
                     :source-browse-url ("Github" "https://github.com/localredhead")
                     :personal-avatar "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/12801483_10154713451449863_4966949962466084989_n.jpg?oh=302271f4d9a4f537c27c9f5b2bb64c74&oe=58DE6D0C"
                     ;; :personal-avatar "https://media.licdn.com/media/p/6/005/095/364/3fd9ba3.jpg"
                     :confound-email t
                     :ignore-file-name-regexp "readme.org"
                     :category-ignore-list ("themes" "assets" "notes" "moleskin"))
                    ;; more projects or sites config can be added here
                    ))

;; :summary (("years" :year :updates 10) ("authors" :authors) ("tags" :tags))
;; :repository-directory nil
;; :site-domain nil
;; :site-main-title "ego"
;; :site-sub-title "static site generator"
;; :repository-org-branch "source"
;; :repository-html-branch "master"
;; :theme-root-directory nil
;; :theme (default)
;; :source-browse-url nil
;; :personal-avatar nil
;; :personal-disqus-shortname nil
;; :personal-duoshuo-shortname nil
;; :personal-google-analytics-id nil
;; :default-category "blog"
;; :about ("About" "/about/")
;; :rss ("RSS" "/rss.xml")
;; :category-ignore-list ("themes" "assets")
;; :ignore-file-name-regexp "\n"
;; :summary (("tags" :tags))
;; :confound-email t
;; :force-absolute-url t
;; :preparation-function nil
;; :get-title-function ego--get-title
;; :retrieve-category-function ego--get-file-category
;; :repo-files-function ego--git-all-files
;; :addition-files-function nil
;; :org-export-function ego--default-org-export
;; :web-server-docroot "~/.emacs.d/ego-server/default"
;; :web-server-port 9876
;; :html-creator-string ,(format "<a href=\"http://www.gnu.org/software/emacs/\">Emacs</a> %s\
;; (<a href=\"http://orgmode.org\">Org mode</a> %s)"
