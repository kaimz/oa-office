package cn.qnight.common;

import org.apache.commons.io.FilenameUtils;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.core.io.ClassPathResource;


/**
 * FastDFS工具类
 */

public class FastDFSUtils {
	public static String uploadPic(UploadFileVo vo){
		
		String path = null;
		//clientGloble读配置文件
		ClassPathResource resource = new ClassPathResource("fdfs_client.conf");
		try {
			ClientGlobal.init(resource.getClassLoader().getResource("fdfs_client.conf").getPath());
			//trackerclient
			TrackerClient trackerclient = new TrackerClient();
			TrackerServer trackerServer = trackerclient.getConnection();
			//storageclient
			StorageClient1 storageClient1 = new StorageClient1(trackerServer,null);
			//文件扩展名
			String ext = FilenameUtils.getExtension(vo.getName());
			//mata list是表文件的描述
			NameValuePair[] mata_list = new NameValuePair[3];
			mata_list[0] = new NameValuePair("fileName",vo.getName());
			mata_list[1] = new NameValuePair("fileExt",ext);
			mata_list[2] = new NameValuePair("fileSize",String.valueOf(vo.getSize()));
			path = storageClient1.upload_file1(vo.getPic(), ext, mata_list);
		} catch (Exception e) {
			
		} 
		return path;
	}
}
