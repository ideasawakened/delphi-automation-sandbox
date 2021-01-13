unit HelloWorld.Messages;

interface

type

  TMessageGenerator = class
  public
    function DefaultMessage():string;
  end;

const
  DefaultHelloWorldMessage = 'Hello World!';

implementation


function TMessageGenerator.DefaultMessage():string;
begin
  Result := DefaultHelloWorldMessage;
end;

end.
