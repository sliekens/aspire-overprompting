var builder = DistributedApplication.CreateBuilder(args);

var someConnection = builder.AddConnectionString("SomeConnection");

var apiService = builder.AddProject<Projects.Overprompting_ApiService>("apiservice")
    .WithHttpHealthCheck("/health")
    .WithReference(someConnection);

var env = builder.AddDockerComposeEnvironment("env");
env.WithDashboard(false);

builder.Build().Run();
