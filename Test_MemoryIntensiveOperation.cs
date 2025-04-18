[Test]
public void Test_MemoryIntensiveOperation()
{
    // Arrange: Mock dependencies and set up test environment
    var mockService = new Mock<IMyService>();
    var systemUnderTest = new MyComponent(mockService.Object);

    // Act: Perform the operation
    systemUnderTest.MemoryIntensiveOperation();

    // Assert: Validate normal behavior
    Assert.AreEqual(expected, actual);

    // Optional: Collect memory dump
    if (IsMemoryUsageHigh())
    {
        CollectMemoryDump();
    }
}

private bool IsMemoryUsageHigh()
{
    // Check memory usage (e.g., using GC.GetTotalMemory or PerformanceCounters)
    return GC.GetTotalMemory(false) > 100_000_000; // Example threshold
}

private void CollectMemoryDump()
{
    using var process = Process.GetCurrentProcess();
    var pid = process.Id;
    var dumpPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "test_dump.dmp");

    var psi = new ProcessStartInfo
    {
        FileName = "dotnet-dump",
        Arguments = $"collect -p {pid} -o {dumpPath}",
        RedirectStandardOutput = true,
        UseShellExecute = false
    };

    using var dumpProcess = Process.Start(psi);
    dumpProcess.WaitForExit();
    Console.WriteLine(File.ReadAllText(dumpPath));
}
