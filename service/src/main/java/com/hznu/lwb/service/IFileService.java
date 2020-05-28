package com.hznu.lwb.service;

import com.hznu.lwb.model.File;
import com.hznu.lwb.model.UserDownloadFileKey;
import com.hznu.lwb.model.result.ApiResult;
import com.sun.mail.imap.AppendUID;

public interface IFileService {
    ApiResult insert(File file);

    ApiResult selectByPrimaryKey(String fileName);

    ApiResult selectByUploader(String uploaderId);

    ApiResult delete(String fileName);

    ApiResult insertRecord(UserDownloadFileKey userDownloadFileKey);

    ApiResult selectRecord(String userId);
}
