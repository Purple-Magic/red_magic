restart_with_local_gems:
	sudo rm -rf vendor/tramway && cp -r ../tramway vendor && dip bundle && dip up web sidekiq anycable
