unit Utils;

interface

uses Classes, Cliente;

const
  Inserindo = 0;
  Editando  = 1;

type
  TEstados = Set of Inserindo..Editando;

implementation

end.
