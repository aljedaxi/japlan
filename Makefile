node_modules:
	@npm i

timeline.html: project.mw node_modules
	@npx mw $< $@
	@open $@
	
serve: project.mw node_modules
	@npx mw serve $< -p 25565 -o timeline

project.json: project.mw
	@npx mw $< -o json $@

groups.jsonl: project.json
	@jq -c '.timelines[].events.value[]' < $< > $@

events.jsonl: groups.jsonl
	@jq -c '.value[]' < $< > $@

events.csv: events.jsonl
	@jq -r '"\(.value.dateText),\(.value.eventText)"' < $< > $@
