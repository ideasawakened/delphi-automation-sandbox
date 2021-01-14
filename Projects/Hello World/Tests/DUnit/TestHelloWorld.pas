unit TestHelloWorld;

interface

uses
  TestFramework,
  HelloWorld.Messages;

type
  TestTMessageGenerator = class(TTestCase)
  published
    procedure TestDefaultMessage();
    procedure TestAlwaysTrue();
  end;

implementation


procedure TestTMessageGenerator.TestAlwaysTrue();
begin
  Check(True);
end;


procedure TestTMessageGenerator.TestDefaultMessage();
var
  vGenerator:TMessageGenerator;
begin
  vGenerator := TMessageGenerator.Create();
  try
    Check(vGenerator.DefaultMessage = DefaultHelloWorldMessage, 'Incorrect default message');
  finally
    vGenerator.Free();
  end;
end;


initialization

RegisterTest(TestTMessageGenerator.Suite);

end.
