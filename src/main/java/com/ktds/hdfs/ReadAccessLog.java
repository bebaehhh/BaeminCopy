package com.ktds.hdfs;

import java.io.IOException;
import java.util.stream.Collectors;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.LocatedFileStatus;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.fs.RemoteIterator;

public class ReadAccessLog {

	public static void main(String[] args) {
		System.out.println(get());
	}
	
	public static String get() {
		
		Configuration conf = new Configuration();
		conf.set("fs.defaultFS", "hdfs://192.168.56.102:9000");
		//201711211016, /BaeminCopy/mypage/mypage_m, GET, 1
		try {
			FileSystem fs = FileSystem.get(conf);
			RemoteIterator<LocatedFileStatus> remote = fs.listFiles(new Path("/Admin/BaeminCopy"), true);
			return ReadHDFS.stream(fs, remote).collect(Collectors.joining("\n"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
		
	}
	
}
