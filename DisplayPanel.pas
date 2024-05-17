unit DisplayPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDisplay = class(TFrame)
    DisplayTab: TEdit;
  private
    function GetDisplayText(): string;
    procedure SetDisplayText(data : string);
  public
    property DisplayText: string read GetDisplayText write SetDisplayText;
  end;

implementation

procedure TDisplay.SetDisplayText(data : string);
begin
  DisplayTab.Text := data;
end;

function TDisplay.GetDisplayText(): string;
begin
  result:= DisplayTab.Text;
end;

{$R *.dfm}

end.
