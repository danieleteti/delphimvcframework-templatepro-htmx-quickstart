unit ControllerU;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons, System.Generics.Collections;

type
  [MVCPath]
  TMyController = class(TMVCController)
  public
    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.TEXT_HTML)]
    function Index: String;

    [MVCPath('/reversedstrings')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.TEXT_PLAIN)]
    function GetReversedString(const [MVCFromQueryString('value','')] Value: String): String;

  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger;


function TMyController.Index: String;
begin
  Result := Page('index');
end;

function TMyController.GetReversedString(const Value: String): String;
begin
  ViewData['reversed_string'] := System.StrUtils.ReverseString(Value.Trim);
  Result := Page('partials/reversed');
end;

end.
