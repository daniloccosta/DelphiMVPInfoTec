unit ProdutoMVPIntf;

interface

uses ProdutoIntf, Produto, Generics.Collections, Controls;

type
  IProdutoPresenter = interface;

  IProdutoView = interface
    ['{28C44980-DE2A-46A6-8414-89E95FBDAF13}']
    function GetProduto: TProduto;
    procedure SetProduto(Value: TProduto);

    function GetPresenter: IProdutoPresenter;
    procedure SetPresenter(const Value: IProdutoPresenter);
    function ShowView: TModalResult;

    property Produto: TProduto read GetProduto write SetProduto;
    property Presenter: IProdutoPresenter read GetPresenter write SetPresenter;
  end;

  IProdutoPresenter = interface
    ['{789B6C3E-2DA5-40C5-A14E-7976C4D7F57D}']
    function GetModel: IProduto;
    procedure SetModel(const Value: IProduto);
    function GetView: IProdutoView;
    procedure SetView(const Value: IProdutoView);

    procedure Add;
    function Get: TProduto;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TProduto>;

    property Model: IProduto read GetModel write SetModel;
    property View: IProdutoView read GetView write SetView;
  end;

implementation

end.
