package a

import(
	g "github.com/hairongGao/cue-mod:gs_ingress"
)

a: g.template


parameter:{
	domain: "kjlkj"
	http:{
		path: "abc/"
	}
}

