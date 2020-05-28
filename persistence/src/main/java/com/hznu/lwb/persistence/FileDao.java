package com.hznu.lwb.persistence;

import com.hznu.lwb.model.File;
import com.hznu.lwb.model.UserDownloadFileKey;

import java.util.List;

public interface FileDao {

    Integer deleteByPrimaryKey(String filePath);

    Integer insert(File record);

    File selectByPrimaryKey(String filePath);

    List<File> selectByUploader(String uploaderId);

    Integer insertRecord(UserDownloadFileKey userDownloadFileKey);

    List<UserDownloadFileKey> selectRecord(String userId);
}