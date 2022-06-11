package d

import(
	g "github.com/hairongGao/cue-mod:gs_istio_vs"
)


istio: g.template
istio:{
	parameter:{
		domain: "jklj"
		http: [{
			headers:
				request:
        	set:
          	test: "true"
			match: [{
				uri:
					prefix: "kjklj"
				headers:
					"X-Gandalf-Mode":
              exact: "gray"
			}]
			route:[{
					destination:{host:"api", subset:"123"}
			}]
			rewrite:
				uri: "/"
			corsPolicy:{
				allowOrigins:[
					{exact: "https://cloud.dev.gs-robot.com"}
				]
			}

		}]

	}
	context:{
		name: "kjk"
	}
}







