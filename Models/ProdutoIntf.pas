unit ProdutoIntf;

interface

uses Produto, Generics.Collections;

type
  IProduto = interface
    ['{29FBA039-37C1-4385-BDFB-3647C2909925}']
    function GetProduto: TProduto;
    procedure SetProduto(Value: TProduto);
    procedure Add;
    function Get: TProduto;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TProduto>;
    property Produto: TProduto read GetProduto write SetProduto;
  end;

implementation

end.
