.PHONY: start stop

start:
				docker-compose up -d
				kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097

stop:
				docker-compose down
