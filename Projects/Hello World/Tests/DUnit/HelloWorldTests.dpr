program HelloWorldTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TextTestRunner,
  TestHelloWorld in 'TestHelloWorld.pas',
  HelloWorld.Messages in '..\..\Source\HelloWorld.Messages.pas',
  VSoft.DUnit.XMLTestRunner in '..\..\..\..\ThirdParty\DUnit-XML\VSoft.DUnit.XMLTestRunner.pas',
  VSoft.MSXML6 in '..\..\..\..\ThirdParty\DUnit-XML\VSoft.MSXML6.pas';

{$R *.RES}

begin

  {$IFDEF CONSOLE_TESTRUNNER}
    {$WARN SYMBOL_PLATFORM OFF}
    if DebugHook = 0 then
    begin
      //not running in debugger, create DEFAULT_FILENAME 'dunit-report.xml'
      //tried XMLTestRunner2 via https://cc.embarcadero.com/Item/28239
      //  NUnit-2.x  Attribute 'failures' must appear on element 'test-results'.
      //  XUnit.net  dunit-report.xml' doesnt match the JUnit format.

      //Switched to DUnit-XML from VSoft: https://github.com/VSoftTechnologies/DUnit-XML
      with VSoft.DUnit.XMLTestRunner.RunRegisteredTests do
        Free;
    end
    else
    begin
      with TextTestRunner.RunRegisteredTests do
        Free;

      { to set ExitCode
        see: https://quality.embarcadero.com/browse/RSP-31832
      with TextTestRunner.RunRegisteredTests do
      begin
        if not WasSuccessful then
        begin
          ExitCode := 1;
        end;
        Free;
      end;
      }

      //since we're running with the debugger, pause for dev to view results
      Readln;
    end;
  {$ELSE}
    //GUI application if CONSOLE_TESTRUNNER not defined
    DUnitTestRunner.RunRegisteredTests;
  {$ENDIF}
end.

