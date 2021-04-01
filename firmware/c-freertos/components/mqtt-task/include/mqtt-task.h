#ifndef MQTT_H
#define MQTT_H

#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "freertos/semphr.h"

struct MqttTaskConfig {
    SemaphoreHandle_t *wifi_semaphore;
    QueueHandle_t *sensor_queue;
};

void mqtt_task(void *params);

enum Topic {
    TOPIC_ALIVE,
    TOPIC_STATUS
};
struct MsgData {
    enum Topic topic;
    uint8_t data;
};

#endif
