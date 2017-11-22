package com.ktds.hdfs;

import org.apache.hadoop.fs.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.stream.Stream;

public class ReadHDFS {

    private FileSystem fs;

    private static ReadHDFS readHDFS;

    public static ReadHDFS setInputStream(FileSystem fs) {
        readHDFS = new ReadHDFS();
        readHDFS.fs = fs;
        return readHDFS;
    }

    public String read(Path path) {
        FSDataInputStream inputStream = null;
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

        String data = "";

        try {
            inputStream = fs.open(path);
            data = read(inputStream, outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            close(inputStream, outputStream);
        }

        return data;
    }

    public static Stream<String> stream(FileSystem fs, RemoteIterator<LocatedFileStatus> fileIterator) {
        return CustomStreamSupport.stream(fileIterator)
                .filter(FileStatus::isFile)
                .filter(fileStatus -> !fileStatus.getPath().getName().equals("_SUCCESS"))
                .filter(fileStatus -> fileStatus.getLen() > 0)
                .map(fileStatus -> {
                    // 내용 받아오기
                	String data = ReadHDFS.setInputStream(fs)
                            .read(fileStatus.getPath());
	                	if(data.endsWith("\n")) {
	                		data = data.substring(0, data.length() -1);
	                	}
                    return data;
                })
                /*.map(str -> str.replace("\n", ""))
                .map(str -> str.replace("\r", ""))*/;
    }


    private String read(FSDataInputStream inputStream, ByteArrayOutputStream outputStream) {

        byte[] b = new byte[1];
        try {

            while(inputStream.read(b) != -1) {
                outputStream.write(b);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return new String(outputStream.toByteArray());
    }

    private void close(FSDataInputStream inputStream, ByteArrayOutputStream outputStream) {
        if(outputStream != null) {
            try {
                outputStream.close();
            } catch (IOException e) {
            }
        }

        if(inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e) {
            }
        }
    }

}
