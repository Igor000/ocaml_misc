(*
 *https://stackoverflow.com/questions/17704111/marshalling-a-hash-table-in-ocaml

 To compile and run:

 ocamlc -o hashtabl_marshall_demo.byte hashtabl_marshall_demo.ml
 ./hashtabl_marshall_demo.byte

*)

type t = (string, string) Hashtbl.t;;

let key = "key" in
let t_original : t = Hashtbl.create 1 in
Hashtbl.add t_original key "value";
let key2 = "key2" in
Hashtbl.add t_original key2 "value2";
let t_marshalled = Marshal.to_string t_original [] in
let t_unmarshalled : t = Marshal.from_string t_marshalled 0 in
begin
  print_endline ("Original:  key = " ^ key  ^ " result  = " ^ (Hashtbl.find t_original key) );
  print_endline ("Marshalled key = " ^ key  ^ " result  = " ^ (Hashtbl.find t_unmarshalled key) );

  print_endline ("Original:  key = " ^ key2  ^ " result  = " ^ (Hashtbl.find t_original key2) );
  print_endline ("Marshalled key = " ^ key2  ^ " result  = " ^ (Hashtbl.find t_unmarshalled key2) );

  assert ((Hashtbl.find t_original key) = (Hashtbl.find t_unmarshalled key));
  print_endline ("==================== " );

  print_endline ("Iterating t_original " );
  Hashtbl.iter (fun x y -> Printf.printf "%s -> %s\n" x y) t_original;

  print_endline ("==================== " );
  print_endline ("Iterating t_unmarshalled " );
  Hashtbl.iter (fun x y -> Printf.printf "%s -> %s\n" x y) t_unmarshalled;
end
