package tasks

import (
	"github.com/input-output-hk/plutus-ops/pkg/schemas/nomad:types"
)

#SimpleTask: types.#stanza.task & {
	#flake: types.#flake

	#namespace: string
        #memory: uint

	driver: "exec"

	kill_timeout: "30s"

	//vault: {
	//	policies:    [ "nomad-cluster" ]
	//	change_mode: "noop"
	//}

	resources: {
		cpu:    4000
		memory: #memory
	}

	config: {
		flake:   #flake
		command: "/bin/entrypoint"
	}
}