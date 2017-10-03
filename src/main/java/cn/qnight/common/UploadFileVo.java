package cn.qnight.common;

import java.io.Serializable;

/**
 * 上传文件vo
 */
public class UploadFileVo implements Serializable{
	
	private static final long serialVersionUID = -1829317741938100757L;
	/**
	 * 文件二进制
	 */
	private byte[] pic;
	/**
	 * 文件名称
	 */
	private String name;
	/**
	 * 文件长度
	 */
	private Long size;
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getSize() {
		return size;
	}
	public void setSize(Long size) {
		this.size = size;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
