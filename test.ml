open Lwt.Infix

(* Append a string to the content of an element *)
let append_inner_html elt str =
  let content = elt##.innerHTML##concat (Js.string str) in
  elt##.innerHTML := content

let () =
  Lwt_js_events.async begin fun () ->
    (* Print something in the javascript console *)
    print_endline "Hello there \\o";

    (* getElementById *)
    let elt = Dom_html.getElementById_exn "test" in

    (* Wait 1 second and append "..2" *)
    Lwt_js.sleep 1. >>= fun () ->
    append_inner_html elt "..2";

    (* Wait 1 second and append "..1" *)
    Lwt_js.sleep 1. >>= fun () ->
    append_inner_html elt "..1";

    (* Wait 1 second and append "<br/>Hi \\o" *)
    Lwt_js.sleep 1. >>= fun () ->
    append_inner_html elt "<br/>Hi \\o";

    (* Monad stuff (ask me later if you want/need) *)
    Lwt.return ()
  end
