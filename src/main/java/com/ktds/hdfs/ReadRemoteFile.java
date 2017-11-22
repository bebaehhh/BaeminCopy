package com.ktds.hdfs;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class ReadRemoteFile {

	private List<File> fileList;
	
	private ReadRemoteFile() {
		fileList = new ArrayList<>();
	}
	
	public static String get(String directoryPath, Predicate<File> fileFilter) {
		ReadRemoteFile rrf = new ReadRemoteFile();
		List<File> fileList = rrf.get(new File(directoryPath));
		return rrf.makeString(rrf.getFileDesc(fileList, fileFilter));
	}
	
	private List<File> get(File filePath) {
		if ( filePath.exists() ) {
			
			if ( filePath.isDirectory() ) {
				File[] files = filePath.listFiles();
				
				for(File f : files) {
					get(f);
				}
			}
			else {
				fileList.add(filePath);
			}
		}
		
		return fileList;
	}
	
	private List<String> getFileDesc(List<File> fileList, Predicate<File> p) {
		return fileList.stream()
						.filter(p)
						.flatMap(file -> {
							try {
								List<String> result = Files.readAllLines(Paths.get(URI.create("file:///" + file.getAbsolutePath().replace("\\", "/"))));
								return result.stream();
							} catch (IOException e) {}
							return null;
						})
						.collect(Collectors.toList());
	}
	
	private String makeString(List<String> fileList) {
		String result = "";
		for ( String desc: fileList ) {
			result += desc + "\n";
		}
		return result;
	}
	
}
