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
    outputs: {
        Ingress: {
            apiVersion: "networking.k8s.io/v1beta1"
            kind:       "Ingress"
            metadata: {
                name: string
                annotations: {}
            }
            spec: {
                rules: [{
                    host: string
                    http: {
                        paths: []
                    }
                }]
            }
        }
    }
    context: {
        name:      string
        namespace: string
        revision:  string
    }
    parameter: {
        annotations: {}
        domain: string
        http: {}
    }
}
