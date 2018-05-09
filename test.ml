open Lwt.Infix

let () =
  Lwt_js_events.async begin fun () ->
    print_endline "Hello there \\o";
    let elt = Dom_html.getElementById_exn "test" in
    let content = elt##.innerHTML in
    Lwt_js.sleep 1. >>= fun () ->
    let content = content##concat (Js.string "..2") in
    elt##.innerHTML := content;
    Lwt_js.sleep 1. >>= fun () ->
    let content = content##concat (Js.string "..1") in
    elt##.innerHTML := content;
    Lwt_js.sleep 1. >>= fun () ->
    elt##.innerHTML := Js.string "Hi \\o";
    Lwt.return ()
  end
