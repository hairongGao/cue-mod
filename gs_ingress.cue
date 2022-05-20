package gs_ingress

"ingress": {
	annotations: {}
	attributes: {
		//	You need to set this attribute is you want UX to capture this trait
		appliesToWorkloads: ["*"]
		podDisruptive: false
	}
	description: "Enable public web traffic for the component."
	labels: {}
	type: "trait"
}

template: {
	// trait template can have multiple outputs in one trait
	outputs: ingress: {
		apiVersion: "networking.k8s.io/v1beta1"
		kind:       "Ingress"
		metadata: {
			name: context.name
		if parameter.annotations != _|_ {
			annotations: parameter.annotations
		}
		}
		spec: rules: [{
			host: parameter.domain
			http: paths: [
				for k, v in parameter.http {
					path: k
					backend: {
						serviceName: context.name
						servicePort: v
					}
				},
			]
		}]
	}
	parameter: {
		// +usage=Specify the domain you want to expose
		domain: string
		// +usage=Annotations variable name
    annotations: [string]: string
		// +usage=Specify the mapping relationship between the http path and the workload port
		http: [string]: int
	}

	context: {
    name: "test"
    namespace: "test"
    revision: "11111"
	}
}
