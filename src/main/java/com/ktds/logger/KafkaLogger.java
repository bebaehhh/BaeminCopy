package com.ktds.logger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class KafkaLogger {
	 private Logger logger;

	    public KafkaLogger(Class loggerClass) {
	        this.logger = LoggerFactory.getLogger(loggerClass);
	    }

	    public void error(final String key, final String message) {
	        logger.error(message);
	        KafkaSend.send(key, message);
	    }

	    public void warn(final String key, final String message) {
	        logger.warn(message);
	        KafkaSend.send(key, message);
	    }

	    public void info(final String key, final String message) {
	        logger.info(message);
	        KafkaSend.send(key, message);
	    }

	    public void debug(final String key, final String message) {
	        logger.debug(message);
	        KafkaSend.send(key, message);
	    }

	    public void trace(final String key, final String message) {
	        logger.trace(message);
	        KafkaSend.send(key, message);
	    }
}
