default:
	dune build

clean:
	dune clean

run:
	dune exec main

.PHONY: default clean run