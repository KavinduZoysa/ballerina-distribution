import ballerina/test;
import ballerina/io;

(any|error)[] outputs = [];
int count = 0;

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
public function mockPrint(any|error... s) {
    outputs[count] = string.convert(s[0]);
    count += 1;
}

@test:Config
function testFunc() {
    main();
    test:assertEquals(outputs[1], "Invoke local participant function.");
    test:assertEquals(outputs[2], "Local participant panicked.");
    test:assertEquals(outputs[3], "Rollback handler #2 executed.");
    test:assertEquals(outputs[4], "Rollback handler #1 executed.");
}
