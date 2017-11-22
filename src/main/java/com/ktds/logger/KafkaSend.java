package com.ktds.logger;

import java.util.Properties;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;

public class KafkaSend {
	private static KafkaProducer<String, String> producer;
	private static final String topic = "sparkTest";

	public static void send(final String key, final String value) {
		setup();

		producer.send(new ProducerRecord<String, String>(topic, key, value));
		producer.close();
	}

	private static void setup() {
		Properties props = new Properties();
		setProperties(props);

		producer = new KafkaProducer<String, String>(props);
	}

	private static void setProperties(Properties props) {
		props.put("bootstrap.servers", "localhost:9092");

		// prop.put("acks", "all");
		// prop.put("block.on.buffer.full", "true");

		props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
	
	}

}
