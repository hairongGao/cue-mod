package a

import(
	g "github.com/hairongGao/cue-mod:gs_ingress"
)

template: g.template&{
	parameter:{
		domain: parameter.domain
		http: parameter.http
	}
	context:{
		name: context.name
		namespace: context.namespace
		revision: context.revision
	}
}

parameter:{
	domain?: string
	http: [string]: int
}
context:{
	name: string
	namespace: string
	revision: string
}





