;;install slackcat from rubygems
(setenv "SLACK_TOKEN" "xoxp-3016632572-3015320917-3156231576-10fa95")

(defvar slackcat-bin  "slackcat" "Command to invoke slackcat.")
(defvar slackcat-args "-c skype"   "Default arguments to pass to slackcat.")

(defun slackcat (&optional b e)
  "Upload contents of region to slack chat."
  (interactive "r")
  (let ((args (read-from-minibuffer "slackcat args: " slackcat-args)))
    (shell-command-on-region b e (format "%s %s" slackcat-bin args))))
