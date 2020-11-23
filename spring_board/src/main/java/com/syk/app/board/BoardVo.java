package com.syk.app.board;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVo {

	@JsonProperty(value = "id")
	private String boardId;

	private String title;
	private String contents;
	private String password;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date createDate; // LocalDateTime , Date
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date updateDate; // LocalDateTime , Date

	private String beforeTitle;
	private String beforeContents;
	
//	@JsonIgnore
//	String jobId;


}
