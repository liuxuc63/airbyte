package io.airbyte.integrations.destination.e2e_test.logging;

import io.airbyte.protocol.models.AirbyteRecordMessage;

public interface TestingLogger {

  enum LoggingType {
    FirstN,
    EveryNth,
    RandomSampling
  }

  void log(AirbyteRecordMessage recordMessage);

}
