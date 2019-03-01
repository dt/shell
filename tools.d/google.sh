
if [[ -d /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk ]]; then

	# The next line updates PATH for the Google Cloud SDK.
	source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'

	# The next line enables shell command completion for gcloud.
	source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi
