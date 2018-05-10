all: jbuilder

jbuilder:
	jbuilder build test.bc.js

ocamlbuild:
	ocamlbuild -no-links -use-ocamlfind -plugin-tag "package(js_of_ocaml.ocamlbuild)" -package js_of_ocaml -package js_of_ocaml-ppx -package js_of_ocaml-lwt test.js
