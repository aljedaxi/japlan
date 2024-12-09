timeline.html: project.mw
	@npx mw $< $@
	@open $@
	
serve: project.mw
	@npx mw serve $< -p 25565 -o timeline
