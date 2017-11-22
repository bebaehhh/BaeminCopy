package com.ktds.hdfs;

import org.apache.hadoop.fs.LocatedFileStatus;
import org.apache.hadoop.fs.RemoteIterator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CustomStreamSupport {

    public static Stream<LocatedFileStatus> stream(RemoteIterator<LocatedFileStatus> remoteIterator) {
        List<LocatedFileStatus> fileList = new ArrayList<>();
        try {
            while ( remoteIterator.hasNext() ) {
                fileList.add(remoteIterator.next());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fileList.stream();
    }
}
